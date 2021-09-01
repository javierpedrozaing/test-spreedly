require 'httparty'

class Transaction < ActiveRecord::Base
  belongs_to :flight
  include HTTParty
  attr_accessible :amount, :quantity, :token

  def buy(token, amount)
    uri = ENV['URI']
  end
end
