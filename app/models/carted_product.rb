class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order, optional: true #the optional true allows for the order number to come at a later date

  validates :product_id, presence: true
  validates :quantity, presence: true
end
