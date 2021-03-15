class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order, optional: true

  validates :product_id, presence: true
  validates :quantity, presence: true
end
