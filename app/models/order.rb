class Order < ApplicationRecord
  validates :status, presence: true, numericality: true
  validates :total, presence: true
end
