class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :pizza_name
      t.string :restaurant
      t.string :price
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
