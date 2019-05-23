class Order < ApplicationRecord
  validates :status, presence: true
  validates :total, presence: true
  belongs_to :user
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  enum status: {pending: 0, accept: 1, refuse: 2}
  scope :order_created_at_desc, -> {order created_at: :desc}
end
