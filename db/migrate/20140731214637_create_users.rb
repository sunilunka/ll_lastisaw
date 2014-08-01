class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :insta_username, :string
      t.column :insta_access_token, :string
      t.timestamps
    end

    add_reference :reviews, :user, index: true
  end
end
