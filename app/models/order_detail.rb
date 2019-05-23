class OrderDetail < ApplicationRecord
  belongs_to :product
  validates :quantity, presence: true
  validates :price, presence:true, numericality: true
  scope :top_product, -> {group("product_id").order("sum(quantity) desc")
    .limit(Settings.product.limit).pluck(:product_id)}
end
