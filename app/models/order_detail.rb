class OrderDetail < ApplicationRecord
  validates :quantity, presence: true
  validates :price, presence:true, numericality: true
end
