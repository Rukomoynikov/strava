class PagesController < ApplicationController
  skip_before_action :authorize_user

  def home
    if @current_user
      @activities = Rails.cache.fetch("#{@current_user.athlete_id}/last_activities") do
        @current_user.strava_activities
      end
    end

    render "pages/home"
  end
end
