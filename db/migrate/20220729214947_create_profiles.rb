class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
        t.integer :user_id
        t.string :first_name
        t.string :artist_name
        t.string :arrangement
        t.string :genre
        t.string :contact_info
        t.text :description
        t.timestamps
    end
  end
end
