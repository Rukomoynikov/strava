class CreateStravaActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :strava_activities do |t|
      t.jsonb :raw
      t.datetime :start_date
      t.integer :average_heartrate
      t.integer :max_heartrate
      t.string :name
      t.integer :distance
      t.references :user_credentials, null: false, foreign_key: true

      t.timestamps
    end
  end
end
