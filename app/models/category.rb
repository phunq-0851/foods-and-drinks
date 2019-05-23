class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: Settings.minimum_category }
  scope :get_category, -> {select :id, :name}
  has_many :products
end
