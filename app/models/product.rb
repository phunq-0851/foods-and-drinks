class Product < ApplicationRecord
  has_many :order_details
  belongs_to :category
  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: {minimum: Settings.minimum_product}
  validates :describe, presence: true
  validates :quantity, presence: true, numericality: true
  # validates :picture, presence: true, allow_nil: true
  validates :price, presence: true, numericality: true
  scope :order_created_at_desc, -> {order created_at: :desc}
  scope :category_by, -> (category){where category_id: category}
  scope :new_product, -> {order(created_at: :desc).limit(Settings.product.limit)}
  scope :relate_product, -> (category){(where category_id: category).limit(Settings.product.limit)}
  scope :top_product_list, -> {where(id: Product.selling_requests).reverse}

  def self.selling_requests
    OrderDetail.top_product
  end
end
