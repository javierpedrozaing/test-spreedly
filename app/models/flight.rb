class Flight < ActiveRecord::Base
  attr_accessible :destination, :origin, :price
  has_many :transactions, foreign_key: "flight_id"
end
