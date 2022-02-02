# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    name { "MyString" }
    description { "MyText" }
    picture { "MyString" }
    ingredients { "" }
    appliances { "" }
    steps { "" }
    recipe_category { nil }
    steps_video { "MyString" }
    user { nil }
  end
end
