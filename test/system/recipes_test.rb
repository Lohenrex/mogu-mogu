# frozen_string_literal: true

require "application_system_test_case"

class RecipesTest < ApplicationSystemTestCase
  setup do
    @recipe = recipes(:one)
  end

  test "visiting the index" do
    visit recipes_url
    assert_selector "h1", text: "Recipes"
  end

  test "should create recipe" do
    visit recipes_url
    click_on "New recipe"

    fill_in "Appliances", with: @recipe.appliances
    fill_in "Description", with: @recipe.description
    fill_in "Ingredients", with: @recipe.ingredients
    fill_in "Name", with: @recipe.name
    fill_in "Picture", with: @recipe.picture
    fill_in "Recipe category", with: @recipe.recipe_category_id
    fill_in "Steps", with: @recipe.steps
    fill_in "Steps video", with: @recipe.steps_video
    fill_in "User", with: @recipe.user_id
    click_on "Create Recipe"

    assert_text "Recipe was successfully created"
    click_on "Back"
  end

  test "should update Recipe" do
    visit recipe_url(@recipe)
    click_on "Edit this recipe", match: :first

    fill_in "Appliances", with: @recipe.appliances
    fill_in "Description", with: @recipe.description
    fill_in "Ingredients", with: @recipe.ingredients
    fill_in "Name", with: @recipe.name
    fill_in "Picture", with: @recipe.picture
    fill_in "Recipe category", with: @recipe.recipe_category_id
    fill_in "Steps", with: @recipe.steps
    fill_in "Steps video", with: @recipe.steps_video
    fill_in "User", with: @recipe.user_id
    click_on "Update Recipe"

    assert_text "Recipe was successfully updated"
    click_on "Back"
  end

  test "should destroy Recipe" do
    visit recipe_url(@recipe)
    click_on "Destroy this recipe", match: :first

    assert_text "Recipe was successfully destroyed"
  end
end
