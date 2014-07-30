class ArtistsEventsReviewsAssociations < ActiveRecord::Migration
  def change
    add_reference :events, :artist, index: true
    add_reference :reviews, :event, index: true
    add_reference :reviews, :artist, index: true
  end
end
