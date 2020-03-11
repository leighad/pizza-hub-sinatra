class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :ingredient_name
      t.string :amount
      t.integer :pizza_id
      t.timestamps null: false
    end
  end
end
