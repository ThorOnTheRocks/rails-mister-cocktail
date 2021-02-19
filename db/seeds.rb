# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning Database..."
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all


puts "Creating ingredients..."

records = JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)
  records["drinks"].each do |record|
    Ingredient.create!(name: record["strIngredient1"])
end

puts "Ingredients are seeded"

puts "Creating cocktails..."

caipirinha = Cocktail.create!(name: "Caipirinha", img_url: "https://www.pingodoce.pt/wp-content/uploads/2016/07/comofazercaipirinha6.jpg")

puts "Cocktails are seeded"

puts "Finished"



