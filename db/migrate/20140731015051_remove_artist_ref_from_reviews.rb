class RemoveArtistRefFromReviews < ActiveRecord::Migration
  def change
    remove_reference :reviews, :artist
  end
end
