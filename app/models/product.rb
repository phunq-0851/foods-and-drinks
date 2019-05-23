class Product < ApplicationRecord
  validates :name, presence: true, length: {minimum: Settings.minimum_product}
  validates :describe, presence: true
  validates :quantity, presence: true, numericality: true
  validates :picture, presence: true
  validates :price, presence: true, numericality: true
end
