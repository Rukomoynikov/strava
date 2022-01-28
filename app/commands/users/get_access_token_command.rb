module Users
  class GetAccessTokenCommand < BaseCommand
    include ApplicationHelper

    private 

    def initialize(code)
      @code = code
    end

    def payload
      url = [
        "https://www.strava.com/api/v3/oauth/token",
        "?client_id=#{strava_settings[:client_id]}",
        "&client_secret=#{strava_settings[:client_secret]}",
        "&code=#{@code}",
        "&grant_type=authorization_code"
      ].join()

      response = JSON.parse(HTTParty.post(url).body)

      User::Credential
        .where(athlete_id: response["athlete"]["id"])
        .first_or_create
        .update(
          expires_at: response["expires_at"],
          expires_in: response["expires_in"],
          refresh_token: response["refresh_token"],
          access_token: response["access_token"],
        )

      @result = response["athlete"]["id"]
    end
  end
end
