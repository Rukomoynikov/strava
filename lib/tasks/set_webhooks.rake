desc "Set webhooks for strava"

task :set_webhooks do
  strava_settings = Rails.application.credentials.strava

  url = [ 
    "https://www.strava.com/api/v3/push_subscriptions",
    "?client_id=#{strava_settings['client_id']}",
    "&client_secret=#{strava_settings['client_secret']}",
    "&verify_token=strava_code",
    "&callback_url=#{strava_settings[:redirect_url]}/strava/subscriptions/incoming"
  ].join()

  HTTParty.post(url)
end

task :look_at_subscription do
  strava_settings = Rails.application.credentials.strava

  url = [ 
    "https://www.strava.com/api/v3/push_subscriptions",
    "?client_id=#{strava_settings['client_id']}",
    "&client_secret=#{strava_settings['client_secret']}"
  ].join()

  response = HTTParty.get(url)

  p JSON.parse(response.body)
end


task :delete_subscription do
  strava_settings = Rails.application.credentials.strava

  url = [ 
    "https://www.strava.com/api/v3/push_subscriptions/210861",
    "?client_id=#{strava_settings['client_id']}",
    "&client_secret=#{strava_settings['client_secret']}"
  ].join()

  response = HTTParty.delete(url)
end
