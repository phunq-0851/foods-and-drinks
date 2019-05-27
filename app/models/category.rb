class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: Settings.minimum_category }
end
