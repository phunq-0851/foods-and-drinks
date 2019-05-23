class Rating < ApplicationRecord
  validates :rate, presence: true, numericality: true
end
