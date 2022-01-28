module ApplicationHelper
  def strava_auth_link
    strava_settings = Rails.application.credentials.strava

    uri = URI::HTTP.build(host: "www.strava.com",
      path: "/oauth/authorize",
      query: "client_id=#{strava_settings[:client_id]}&response_type=code&redirect_uri=#{strava_settings[:redirect_url]}/credentials/exchange_token&approval_prompt=force&scope=activity:read_all")

    uri.to_s
  end

  def access_token_url(code)
    strava_settings = Rails.application.credentials.strava

    "https://www.strava.com/api/v3/oauth/token?client_id=#{strava_settings[:client_id]}&client_secret=#{strava_settings[:client_secret]}&code=#{code}&grant_type=authorization_code"
  end
end
