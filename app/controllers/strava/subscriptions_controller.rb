module Strava
  class SubscriptionsController < ApplicationController
    def confirm
      render json: {
        "hub.challenge": params["hub.challenge"]
      }
    end
  end
end
