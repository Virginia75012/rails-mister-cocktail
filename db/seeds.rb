require 'open-uri'
require 'json'

Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Create'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
ingredients = JSON.parse(json)
new_ingredients = ingredients['drinks']
new_ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end
puts 'Finished !'
