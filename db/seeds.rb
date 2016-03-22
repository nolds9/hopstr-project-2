# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


20.times do |index|
  beer = Beer.create!(name: Faker::Beer.name,
                      style: Faker::Beer.style,
                      ibu: Faker::Beer.ibu,
                      abv: Faker::Beer.alcohol)
end
