class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
    end

    def new
        @flight = Flight.find(params[:flight_id])
        id = @flight.id
        @transaction = Transaction.new
    end

    def create
        token = params[:transaction][:token]
        amount = params[:transaction][:amount]
        
        if params[:expedia]
            payment_to_expedia(token, amount)
        else
            payment_to_gateway(token, amount)
        end
        
    end

    private

    def payment_to_expedia(payment_method_token, amount)
        token_expedia = "MIJdlNlztg00Y7OpAkOOADji7ox"
        deliver_pm = ENV['URI'] + 'receivers/' + token_expedia + '/deliver.json'
        credentials = {            
            "username": ENV['ENVIRONMENT_KEY'],
            "password": ENV['SPREEDLY_SECRET_KEY']            
        }
        body = {
            'delivery': {
                'payment_method_token': payment_method_token,
                'url': 'https://apim.expedia.com',
                "headers": "Content-Type: application/json",
                'body': {
                    "card_number": "{{ credit_card_number }}"
                }
            }
        }.to_json
        result = HTTParty.post(deliver_pm, body: body, headers: { 'Content-Type' => 'application/json'}, basic_auth: credentials)
        render :json => result.body
    end

    def payment_to_gateway(payment_method_token, amount)
        gateway = ENV['URI'] + 'gateways/' + ENV['ENVIRONMENT_TOKEN']+'/purchase.json'        
        credentials = {            
            "username": ENV['ENVIRONMENT_KEY'],
            "password": ENV['SPREEDLY_SECRET_KEY']
        }
        body = {
            "transaction": {
                "payment_method_token": payment_method_token,
                "amount": amount,
                "currency_code": "USD",
                "retain_on_success": true
              }
        }.to_json
        result = HTTParty.post(gateway, body: body, headers: { 'Content-Type' => 'application/json'}, basic_auth: credentials)
        render :json => result.body
    end
end
