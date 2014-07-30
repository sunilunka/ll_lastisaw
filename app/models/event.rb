class Event < ActiveRecord::Base
  # Validations
  validates :date, presence: true
  validates :city_name, presence: true

  # Associations
  belongs_to :artist
  has_many :reviews
end
