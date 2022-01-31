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
      User::Profile.create(
        username: response["athlete"]["username"],
        firstname: response["athlete"]["firstname"],
        lastname: response["athlete"]["lastname"],
        sex: response["athlete"]["sex"],
        picture: response["athlete"]["picture"],
        user_credentials_id: user_credential_id
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
          user_credentials_id: user_credential_id
        }
      }

      Strava::Activity.insert_all(activities)
    end
  end
end

# {"token_type"=>"Bearer",
#  "expires_at"=>1643666377,
#  "expires_in"=>20861,
#  "refresh_token"=>"xxxxxxx",
#  "access_token"=>"xxxxxxx",
#  "athlete"=>
#   {"id"=>35617462,
#    "username"=>"mrukomoynikov",
#    "resource_state"=>2,
#    "firstname"=>"Maksim",
#    "lastname"=>"Rukomoynikov",
#    "bio"=>nil,
#    "city"=>nil,
#    "state"=>nil,
#    "country"=>nil,
#    "sex"=>"M",
#    "premium"=>false,
#    "summit"=>false,
#    "created_at"=>"2018-10-11T11:38:41Z",
#    "updated_at"=>"2020-10-27T19:52:51Z",
#    "badge_type_id"=>0,
#    "weight"=>nil,
#    "profile_medium"=>
#     "https://graph.facebook.com/10217686390452588/picture?height=256&width=256",
#    "profile"=>
#     "https://graph.facebook.com/10217686390452588/picture?height=256&width=256",
#    "friend"=>nil,
#    "follower"=>nil}}
