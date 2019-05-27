class Rating < ApplicationRecord
  validates :name, presence: true
  validates :describe, presence: true
end
