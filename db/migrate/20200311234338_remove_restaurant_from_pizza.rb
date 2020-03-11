class RemoveRestaurantFromPizza < ActiveRecord::Migration
  def change
    remove_column :pizzas, :restaurant, :string
  end
end
