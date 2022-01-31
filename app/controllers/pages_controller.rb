class PagesController < ApplicationController
  skip_before_action :authorize_user

  def home
    if @current_user
      @activities = @current_user.strava_activities
    end

    render "pages/home"
  end
end
