module Strava
  class Activities
    def self.get_one(object_id, access_token)
      response = HTTParty.get "https://www.strava.com/api/v3//activities/#{object_id}?include_all_efforts=true", headers: {
        Authorization: "Bearer #{access_token}",
        Accept: "application/json"
      }

      data = JSON.parse(response.body)
      
      # activities = activities.map { |activity| 
      #   {
      #     raw: activity,
      #     start_date: activity["start_date_local"],
      #     average_heartrate: activity["average_heartrate"],
      #     max_heartrate: activity["max_heartrate"],
      #     name: activity["name"],
      #     distance: activity["distance"],
      #     user_credentials_id: user_credential_id
      #   }
      # }
    end
  end
end
