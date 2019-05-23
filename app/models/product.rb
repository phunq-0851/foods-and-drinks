class Product < ApplicationRecord
  validates :name, presence: true, length: {minimum: Settings.minimum_product}
  validates :describe, presence: true
  validates :quantity, presence: true, numericality: true
  validates :picture, presence: true
  validates :price, presence: true, numericality: true
  scope :order_created_at_desc, -> {order created_at: :desc}
  scope :category_by, -> (category){where category_id: category}
end
