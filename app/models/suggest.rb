class Suggest < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :describe, presence: true
  scope :suggest_by_user, -> (user_id){where user_id: user_id}
end
