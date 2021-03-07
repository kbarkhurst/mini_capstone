class ChangeProductToInteger < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :supplier_id, :string
  end
end
