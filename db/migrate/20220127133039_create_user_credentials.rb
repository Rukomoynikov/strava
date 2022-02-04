class CreateUserCredentials < ActiveRecord::Migration[7.0]
  def change
    create_table :user_credentials do |t|
      t.integer :athlete_id, unique: true
      t.integer :expires_at
      t.integer :expires_in
      t.string :refresh_token
      t.string :access_token

      t.timestamps
    end
  end
end
