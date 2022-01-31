module Strava
  class SubscriptionsController < ApplicationController
    skip_before_action :authorize_user, only: [:confirm]

    def confirm
      p params["hub.challenge"]

      render json: {
        "hub.challenge": params["hub.challenge"]
      }
    end
  end
end

# "hub.challenge": params["hub.challenge"]
