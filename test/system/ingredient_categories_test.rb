# frozen_string_literal: true

require "application_system_test_case"

class IngredientCategoriesTest < ApplicationSystemTestCase
  setup do
    @ingredient_category = ingredient_categories(:one)
  end

  test "visiting the index" do
    visit ingredient_categories_url
    assert_selector "h1", text: "Ingredient categories"
  end

  test "should create ingredient category" do
    visit ingredient_categories_url
    click_on "New ingredient category"

    fill_in "Name", with: @ingredient_category.name
    click_on "Create Ingredient category"

    assert_text "Ingredient category was successfully created"
    click_on "Back"
  end

  test "should update Ingredient category" do
    visit ingredient_category_url(@ingredient_category)
    click_on "Edit this ingredient category", match: :first

    fill_in "Name", with: @ingredient_category.name
    click_on "Update Ingredient category"

    assert_text "Ingredient category was successfully updated"
    click_on "Back"
  end

  test "should destroy Ingredient category" do
    visit ingredient_category_url(@ingredient_category)
    click_on "Destroy this ingredient category", match: :first

    assert_text "Ingredient category was successfully destroyed"
  end
end
