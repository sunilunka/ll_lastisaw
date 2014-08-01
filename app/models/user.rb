class User < ActiveRecord::Base
  # Validations
  validates :insta_username, presence: true, uniqueness: true
  validates :insta_access_token, presence: true, uniqueness: true

  # Associations
  has_many :reviews
end
