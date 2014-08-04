class Event < ActiveRecord::Base
  # Validations
  validates :date, presence: true
  validates :city_name, presence: true

  # Associations
  belongs_to :artist
  has_many :reviews

  # Date cannot be in the future
  validate :date_cannot_be_in_the_future
  def date_cannot_be_in_the_future
    if date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end
end
