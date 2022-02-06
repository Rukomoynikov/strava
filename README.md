# Activity raw (without details)

{
	"id":6625145099, 
	"map":{
		"id":"a6625145099", "resource_state":2, "summary_polyline":nil
	}, 
	"name":"Evening Run", 
	"type":"Run", 
	"manual":false, 
	"athlete": {
		"id":35617462, "resource_state":1
	}, 
	"commute":false, 
	"flagged":false, 
	"gear_id":nil, 
	"private":false, 
	"trainer":true, 
	"distance":243.0, 
	"pr_count":0, 
	"timezone":"(GMT+03:00) Europe/Moscow", 
	"max_speed":0.879, 
	"upload_id":7045190075, 
	"end_latlng":[], 
	"has_kudoed":false, 
	"start_date":"2022-01-30T16:56:20Z", 
	"utc_offset":10800.0, 
	"visibility":"everyone", 
	"external_id":"garmin_push_8230998527", 
	"kudos_count":0, 
	"moving_time":3857, 
	"photo_count":0, 
	"elapsed_time":3857, 
	"start_latlng":[], 
	"workout_type":nil, 
	"athlete_count":1, 
	"average_speed":0.063, 
	"comment_count":0, 
	"has_heartrate":true, 
	"location_city":nil, 
	"max_heartrate":171.0, 
	"upload_id_str":"7045190075", 
	"location_state":nil, 
	"resource_state":2, 
	"start_latitude":nil, 
	"average_cadence":71.1, 
	"start_longitude":nil, 
	"location_country":nil, 
	"start_date_local":"2022-01-30T19:56:20Z", 
	"achievement_count":0, 
	"average_heartrate":135.1, 
	"from_accepted_tag":false, 
	"heartrate_opt_out":false, 
	"total_photo_count":0, 
	"total_elevation_gain":0, 
	"display_hide_heartrate_option":true
}


# Info comes along with token

{"token_type"=>"Bearer",
 "expires_at"=>1643666377,
 "expires_in"=>20861,
 "refresh_token"=>"xxxxxxx",
 "access_token"=>"xxxxxxx",
 "athlete"=> {"id"=>35617462,
   "username"=>"mrukomoynikov",
   "resource_state"=>2,
   "firstname"=>"Maksim",
   "lastname"=>"Rukomoynikov",
   "bio"=>nil,
   "city"=>nil,
   "state"=>nil,
   "country"=>nil,
   "sex"=>"M",
   "premium"=>false,
   "summit"=>false,
   "created_at"=>"2018-10-11T11:38:41Z",
   "updated_at"=>"2020-10-27T19:52:51Z",
   "badge_type_id"=>0,
   "weight"=>nil,
   "profile_medium"=>
    "https://graph.facebook.com/10217686390452588/picture?height=256&width=256",
   "profile"=>
    "https://graph.facebook.com/10217686390452588/picture?height=256&width=256",
   "friend"=>nil,
   "follower"=>nil
  }
}

# Incoming webhook for updating

{
 	"aspect_type"=>"update", 
 	"event_time"=>1643661928, 
 	"object_id"=>6597762220, 
 	"object_type"=>"activity", 
 	"owner_id"=>35617462, 
 	"subscription_id"=>210866, 
 	"updates" => {
 		"title"=>"Night Run"
 	}, 
 	"subscription"=>{
 		"aspect_type"=>"update", 
 		"event_time"=>1643661928, 
 		"object_id"=>6597762220, 
 		"object_type"=>"activity", 
 		"owner_id"=>35617462, 
 		"subscription_id"=>210866, 
 		"updates"=>{"title"=>"Night Run"}
  }
}

# Incoming webhook for creating

{
	"aspect_type"=>"create", 
	"event_time"=>1643896604, 
	"object_id"=>6625145099, 
	"object_type"=>"activity", 
	"owner_id"=>35617462, 
	"subscription_id"=>210866, 
	"updates"=>{}, 
	"subscription"=> {
		"aspect_type"=>"create", 
		"event_time"=>1643896604, 
		"object_id"=>6625145099, 
		"object_type"=>"activity", 
		"owner_id"=>35617462, 
		"subscription_id"=>210866, 
		"updates"=>{}
	}
}

# Decoding summary_polyline

https://github.com/dblock/slack-strava/blob/master/slack-strava/models/map.rb