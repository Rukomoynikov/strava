# frozen_string_literal: true

module Users
  class GetAccessTokenCommand < BaseCommand
    include ApplicationHelper

    private 

    def initialize(code)
      @code = code
    end

    def payload
      response = get_access_token()
      user_credential = self.save_athlete_credentials(response)
      create_user_profile(response, user_credential.id)
      load_last_activities(response["access_token"], user_credential.id)

      @result = response
    end

    def get_access_token
      url = [
        "https://www.strava.com/api/v3/oauth/token",
        "?client_id=#{strava_settings[:client_id]}",
        "&client_secret=#{strava_settings[:client_secret]}",
        "&code=#{@code}",
        "&grant_type=authorization_code"
      ].join()

      response = JSON.parse(HTTParty.post(url).body)
    end

    def save_athlete_credentials(response)
      user_credential = User::Credential
        .where(athlete_id: response["athlete"]["id"])
        .first_or_create

        user_credential.update(
          expires_at: response["expires_at"],
          expires_in: response["expires_in"],
          refresh_token: response["refresh_token"],
          access_token: response["access_token"],
        )

      user_credential
    end

    def create_user_profile(response, user_credential_id)
      user_profile = User::Profile
        .where(user_credentials_id: user_credential_id)
        .first_or_create

      user_profile.update(
        username: response["athlete"]["username"],
        firstname: response["athlete"]["firstname"],
        lastname: response["athlete"]["lastname"],
        sex: response["athlete"]["sex"],
        picture: response["athlete"]["picture"]
      )
    end

    def load_last_activities(access_token, user_credential_id)
      response = HTTParty.get "https://www.strava.com/api/v3/athlete/activities?per_page=200", headers: {
        Authorization: "Bearer #{access_token}",
        Accept: "application/json"
      }

      activities = JSON.parse(response.body)
      
      activities = activities.map { |activity| 
        {
          raw: activity,
          start_date: activity["start_date_local"],
          average_heartrate: activity["average_heartrate"],
          max_heartrate: activity["max_heartrate"],
          name: activity["name"],
          distance: activity["distance"],
          object_id: activity["id"],
          average_speed: activity["average_speed"],
          max_speed: activity["max_speed"],
          average_cadence: activity["average_cadence"],
          moving_time: activity["moving_time"], 
          user_credentials_id: user_credential_id,
        }
      }

      Strava::Activity.upsert_all(activities, unique_by: :object_id)
    end
  end
end
