class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :description
      t.string :picture
      t.jsonb :ingredients, null: false
      t.string :appliances, array: true, null: false
      t.string :steps, array: true, null: false
      t.references :recipe_category, null: false, foreign_key: true
      t.string :steps_video
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
