class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.column :name, :string
      t.timestamps
    end
  end
end
