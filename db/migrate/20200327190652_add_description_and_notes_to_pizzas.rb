class AddDescriptionAndNotesToPizzas < ActiveRecord::Migration
  def change
    add_column :pizzas, :description, :text 
    add_column :pizzas, :notes, :text 
  end
end
