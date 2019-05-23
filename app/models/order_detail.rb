class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  delegate :name, :picture, :quantity, to: :product, prefix: "product"
  validates :quantity, presence: true
  validates :price, presence:true, numericality: true
  scope :top_product, -> {select("product_id, sum(quantity)").group("product_id").order("sum(quantity) desc").limit(6).pluck(:product_id)}
  before_destroy :return_quantity_when_refuse
  after_save :update_quantity_product

  private
  def return_quantity_when_refuse
    product.update_attribute :quantity, product_quantity + quantity if order.pending? || order.refuse?
  end

  def update_quantity_product
    product.update quantity: (product_quantity - quantity.to_i)
  end
end
