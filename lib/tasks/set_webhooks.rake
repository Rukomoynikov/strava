desc "Set webhooks for strava"

task :set_webhooks do
  [ 
    "https://www.strava.com/api/v3/push_subscriptions",
    "?client_id=#{strava_settings['client_id']}",
    "&client_secret=#{strava_settings['client_secret']}",
    "&verify_token=strava_code",
    "&callback_url=#{strava_settings[:redirect_url]}/strava/subscriptions/confirm",
end
