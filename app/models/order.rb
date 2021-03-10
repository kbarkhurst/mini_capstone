class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def subtotal
    quantity * product.price
  end

  def tax
    subtotal * 0.09
  end

  def total
    subtotal + tax
  end
end
