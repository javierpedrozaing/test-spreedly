# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Flight.delete_all

flights = Flight.create([
    {destination: 'Honolulu, HI (HNL)', origin: 'Raleigh-Durham, NC (RDU)', price: 46400},
    {destination: 'Paris, France (CDG)', origin: 'Raleigh-Durham, NC (RDU)', price: 124600},
    {destination: 'London, UK (LHR)', origin: 'Raleigh-Durham, NC (RDU)', price: 118100},
    {destination: 'Auckland, NZ (AKL)', origin: 'Raleigh-Durham, NC (RDU)', price: 155800},
    {destination: 'Austin, TX (AUS)', origin: 'Raleigh-Durham, NC (RDU)', price: 33700},
    {destination: 'Anchorage, AK (ANC)', origin: 'Raleigh-Durham, NC (RDU)', price: 60400}
])