class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.integer :sex
      t.string :picture
      t.references :user_credentials, null: false, foreign_key: true

      t.timestamps
    end
  end
end
