class CreateEventsReviews < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.column :date, :date
      t.column :city_name, :string
      t.timestamps
    end

    create_table :reviews do |t|
      t.column :review, :string
      t.timestamps
    end
  end
end
