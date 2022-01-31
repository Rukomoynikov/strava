module Strava
  class SubscriptionsController < ApplicationController
    def confirm
      p params["hub.challenge"]

      render json: {
        "hub.challenge": params["hub.challenge"]
      }
    end
  end
end

# "hub.challenge": params["hub.challenge"]
