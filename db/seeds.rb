# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

IngredientCategory.destroy_all

IngredientCategory.create!([{
  name: "dairy"
},{
  name: "flour"
},{
  name: "meats"
},{
  name: "poultry"
},{
  name: "liquids"
},{
  name: "alcohol"
},{
  name: "fruits"
},{
  name: "vegetables"
},{
  name: "spices"
},{
  name: "other"
}])

p "Created #{IngredientCategory.count} ingredient categories"


Ingredient.destroy_all

Ingredient.create!([{
  name: "whole milk",
  category: "dairy"
},{
  name: "all-purpose flour",
  category: "flour"
},{
  name: "cake flour",
  category: "flour"
},{
  name: "egg",
  category: "meats"
},{
  name: "water",
  category: "liquids"
},{
  name: "strawberry",
  category: "fruits"
},{
  name: "blueberry",
  category: "fruits"
},{
  name: "unsalted butter",
  category: "dairy"
},{
  name: "mint",
  category: "vegetables"
},{
  name: "heavy whipping cream",
  category: "dairy"
},{
  name: "milk (any)",
  category: "dairy"
},{
  name: "vodka",
  category: "alcohol"
},{
  name: "salt",
  category: "spices"
},{
  name: "sugar",
  category: "spices"
},{
  name: "chocolate",
  category: "other"
},{
  name: "breadcrumbs",
  category: "other"
},{
  name: "tomato",
  category: "vegetables"
},{
  name: "lettuce",
  category: "vegetables"
},{
  name: "cucumber",
  category: "vegetables"
},{
  name: "olive",
  category: "vegetables"
},{
  name: "back olive",
  category: "vegetables"
},{
  name: "squash",
  category: "vegetables"
},{
  name: "potato",
  category: "vegetables"
},{
  name: "celery",
  category: "vegetables"
}])

p "Created #{Ingredient.count} ingredients"


Appliance.destroy_all

Appliance.create!([{
  name: "oven"
},{
  name: "microwave oven"
},{
  name: "saucepan"
},{
  name: "stove"
},{
  name: "whisk"
},{
  name: "mixing bowl"
},{
  name: "mixer"
},{
  name: "baking paper"
},{
  name: "aluminum foil"
},{
  name: "cake mold"
},{
  name: "spatula"
}])

p "Created #{Appliance.count} appliances"


RecipeCategory.destroy_all

RecipeCategory.create!([{
  name: "bakery"
},{
  name: "mexican"
},{
  name: "italian"
},{
  name: "confectionery"
},{
  name: "burgers & sandwiches"
},{
  name: "salads"
},{
  name: "japanese"
},{
  name: "chinese"
},{
  name: "seafood"
}])

p "Created #{RecipeCategory.count} recipe categories"