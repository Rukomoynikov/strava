module Strava
  class SubscriptionsController < ApplicationController
    skip_before_action :authorize_user, only: [:incoming]

    def incoming
      return render json: {
        "hub.challenge": params["hub.challenge"]
      } if params["hub.challenge"]
    end
  end
end

# "hub.challenge": params["hub.challenge"]
