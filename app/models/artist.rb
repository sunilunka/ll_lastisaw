class Artist < ActiveRecord::Base
  # Validations
  validates :name, presence: true, uniqueness: true

  # Associations
  has_many :events
  has_many :reviews  
end
