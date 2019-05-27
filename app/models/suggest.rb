class Suggest < ApplicationRecord
  validates :rate, presence: true, numericality: true
end
