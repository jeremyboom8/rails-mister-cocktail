classes = [Cocktail, Ingredient, Dose]

classes.each do |klass|
	klass.destroy_all
end


require 'json'
require 'open-uri'

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

string =  open(url).read

json = JSON.parse(string)

json["drinks"].each do |item|
	Ingredient.create(name: item["strIngredient1"])
end
