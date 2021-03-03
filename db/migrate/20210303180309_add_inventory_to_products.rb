class AddInventoryToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :inventory_count, :integer
  end
end
