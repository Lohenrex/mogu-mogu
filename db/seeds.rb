# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
}])

p "Created #{Ingredient.count} ingredients"