class AddOriginToPizza < ActiveRecord::Migration
  def change
    add_column :pizzas, :origin, :string
  end
end
