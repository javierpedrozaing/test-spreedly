class TestController < ApplicationController
    def verify_gateways
        gateways = ENV['URI'] + 'gateways/' + ENV['ENVIRONMENT_TOKEN'] +'/verify.json'
        puts "URI GATEAWAYS" + gateways
        options = {
            headers: {'Content-Type' => 'application/json'},
            basic_auth: {
                "username": ENV['ENVIRONMENT_KEY'],
                "password": ENV['SPREEDLY_SECRET_KEY']
            },            
        }
        result = HTTParty.post(gateways, options)
        render :json => result.message
        
    end


    def list_gateways
        list =  ENV['URI'] + 'gateways.json'        
        puts "LIST GATEAWAYS " + list
        puts "AUTHORIZATION " + ENV['AUTHENTICATION_KEY']
        credentials = {            
            "username": ENV['ENVIRONMENT_KEY'],
            "password": ENV['SPREEDLY_SECRET_KEY']            
        }
        result = HTTParty.get(list, headers: {'Content-Type' => 'application/json, base'}, basic_auth: credentials)        
        render :json => result.body 

        # result = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
        # render json: result.body
    end

    def register_receivers
        receivers_uri = ENV['URI'] + 'receivers.json' 
        credentials = {            
            "username": ENV['ENVIRONMENT_KEY'],
            "password": ENV['SPREEDLY_SECRET_KEY']            
        }
        body = {
            "receiver": {
              "receiver_type": "expedia",
              "hostnames": "https://apim.expedia.com",
              "credentials": [
                {
                  "name": "Expedia",
                  "value": 1234,
                  "safe": true
                },
                {
                  "name": "app-secret",
                  "value": 5678
                }
              ]
            }
        }.to_json
        result = HTTParty.post(receivers_uri, body: body, headers: { 'Content-Type' => 'application/json'}, basic_auth: credentials)
        render :json => result.body
    end

    def list_receivers
        receivers = ENV['URI'] + 'receivers_options.json'   
        credentials = {            
            "username": ENV['ENVIRONMENT_KEY'],
            "password": ENV['SPREEDLY_SECRET_KEY']            
        }
        result = HTTParty.get(receivers, headers: {'Content-Type' => 'application/json, base'}, basic_auth: credentials)        
        render :json => result.body 
    end
end
