class AddAdditionalFieldsToActivity < ActiveRecord::Migration[7.0]
  def change
    add_column :strava_activities, :object_id, :bigint, index: { unique: true }
    add_column :strava_activities, :average_speed, :float
    add_column :strava_activities, :max_speed, :float
    add_column :strava_activities, :average_cadence, :float
    add_column :strava_activities, :moving_time, :float

    add_index(:strava_activities, :object_id, unique: true)
  end
end