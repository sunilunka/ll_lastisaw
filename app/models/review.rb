class Review < ActiveRecord::Base
  # Validations
  validates :review, presence: true, length: { maximum: 140 }

  # Associations
  belongs_to :event
  belongs_to :user
end
