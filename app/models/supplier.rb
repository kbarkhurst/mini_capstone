class Supplier < ApplicationRecord
  def products
    Products.where(supplier_id: id)
  end
end
