class Product < ApplicationRecord
  validates :image_url, presence: true
  # validates :image_url, presence: true
  # validates :inventory_count, numericality: { only_integer: true, :greater_than => 0 }
  # validates :price, numericality: { :greater_than => 0 }
  # validates :name, uniqueness: { message: "This product already exists." }
  # validates :name, uniqueness: true { case_sensitive: true }
  # validates :description, length: { maximum: 500, too_long: "500 characters is the max." }
  # validates :description, length: { minimum: 200, too_short: "20 characters is the minimum." }

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    tax + price
  end
end
