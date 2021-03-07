class AddColumnToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :supplier_id, :string
  end
end
