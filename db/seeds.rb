# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

User.destroy_all
Cat.destroy_all

boris = User.new(first_name: "Boris", last_name: "Paillard", address: "16 villa Gaudelet", city: "Paris", email: "boris@lewagon.com", password: "123456" )
boris.save

hector = Cat.new(name: "Hector", category: "Cuddle", race: "Siamese", year_of_birth: 2012, description: "Awesome cat", price_per_day: 28)
hector.user = boris

hector.save
