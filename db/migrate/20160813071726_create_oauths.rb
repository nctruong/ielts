class CreateOauths < ActiveRecord::Migration
  def change
    create_table :oauths do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :oauth_expires_at
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
