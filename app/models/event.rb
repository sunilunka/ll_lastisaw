class Event < ActiveRecord::Base
  validates :date, presence: true
  validates :city_name, presence: true
end
