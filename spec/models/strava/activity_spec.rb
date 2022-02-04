require 'rails_helper'

RSpec.describe Strava::Activity, type: :model do
  it "should have connection with User::Profile instance" do
    user_credential = User::Credential.create(
      athlete_id: 1,
      expires_at: 1,
      expires_in: 1,
      refresh_token: "1",
      access_token: "1",
    )

    Strava::Activity.create(
      start_date: "2022-01-28T21:46:53Z",
      average_heartrate: 153, 
      max_heartrate: 146,
      name: "Night Run",
      distance: 1123,
      raw: {"resource_state"=>2, "athlete"=>{"id"=>35617462, "resource_state"=>1}, "name"=>"Night Run", "distance"=>488.3, "moving_time"=>7203, "elapsed_time"=>7203, "total_elevation_gain"=>0, "type"=>"Run", "workout_type"=>nil, "id"=>6597762220, "start_date"=>"2022-01-28T18:46:53Z", "start_date_local"=>"2022-01-28T21:46:53Z", "timezone"=>"(GMT+03:00) Europe/Moscow", "utc_offset"=>10800.0, "location_city"=>nil, "location_state"=>nil, "location_country"=>nil, "achievement_count"=>0, "kudos_count"=>2, "comment_count"=>0, "athlete_count"=>1, "photo_count"=>0, "map"=>{"id"=>"a6597762220", "summary_polyline"=>nil, "resource_state"=>2}, "trainer"=>true, "commute"=>false, "manual"=>false, "private"=>false, "visibility"=>"everyone", "flagged"=>false, "gear_id"=>nil, "start_latlng"=>[], "end_latlng"=>[], "start_latitude"=>nil, "start_longitude"=>nil, "average_speed"=>0.068, "max_speed"=>2.105, "average_cadence"=>57.0, "has_heartrate"=>true, "average_heartrate"=>121.3, "max_heartrate"=>137.0, "heartrate_opt_out"=>false, "display_hide_heartrate_option"=>true, "upload_id"=>7015915784, "upload_id_str"=>"7015915784", "external_id"=>"garmin_push_8200482162", "from_accepted_tag"=>false, "pr_count"=>0, "total_photo_count"=>0, "has_kudoed"=>false},
      user_credentials: user_credential
    )
  end
end
