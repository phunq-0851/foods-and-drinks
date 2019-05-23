class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :orders
  has_many :suggests
  class << self
    def from_omniauth(access_token)
      data = access_token.info
      user = User.find_by email: data["email"]
      unless user.persisted?
        user = User.create(username: data["name"],
           email: data["email"],
           password: Devise.friendly_token[0,20],
           uid: access_token[:uid],
           provider: access_token[:provider]
        )
      end
      user
    end
  end
end
