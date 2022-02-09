class AddIndexToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_index :recipes, :ingredients, using: :gin
  end
end
