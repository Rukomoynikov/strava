module Strava
  class SubscriptionsController < ApplicationController
    def confirm
      render json: {
        "hub.challeng": params["hub.challeng"]
      }
    end
  end
end
