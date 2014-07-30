class Review < ActiveRecord::Base
  # Validations
  validates :review, presence: true

  # Associations
  belongs_to :event
  belongs_to :artist
end
