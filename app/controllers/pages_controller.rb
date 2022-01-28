class PagesController < ApplicationController
  skip_before_action :authorize_user

  def home
    if @current_user
      strava_settings = Rails.application.credentials.strava

      response = HTTParty.get "https://www.strava.com/api/v3/athlete/activities?per_page=200", headers: {
        Authorization: "Bearer #{@current_user.access_token}",
        Accept: "application/json"
      }

      @activities = JSON.parse(response.body)
    end

    render "pages/home"
  end
end
