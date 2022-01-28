module ApplicationHelper
  def strava_auth_link
    url = [
      "https://www.strava.com/oauth/authorize",
      "?client_id=#{strava_settings[:client_id]}",
      "&response_type=code",
      "&redirect_uri=#{strava_settings[:redirect_url]}/user/credentials/new",
      "&approval_prompt=force",
      "&scope=activity:read_all"
    ].join()

    link_to "Auth via Strava", url
  end

  def access_token_url(code)
    [
      "https://www.strava.com/api/v3/oauth/token",
      "?client_id=#{strava_settings[:client_id]}",
      "&client_secret=#{strava_settings[:client_secret]}",
      "&code=#{code}",
      "&grant_type=authorization_code"
    ].join()
  end

  private

  def strava_settings
    return @strava_settings if @strava_settings.present?

    @strava_settings ||= Rails.application.credentials.strava
  end
end
