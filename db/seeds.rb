require 'json'

string = File.read(Rails.root.join('db', 'ingredients.json'))
ingredients = JSON.parse(string)

drinks = ingredients["drinks"]
drinks.each do |ingredient|
  ingredient.each_value do |value|
    Ingredient.new(name:value).save
  end
end

# Cocktail.create(name:"Mojito", stars: 5, photo:"app/images/mojito.jpg" )
# Cocktail.create(name:"Whisky Sour", stars: 4, photo:"app/images/whisky_sour.jpg")



