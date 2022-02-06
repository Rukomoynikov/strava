module Strava
  class SubscriptionsController < ApplicationController
    protect_from_forgery except: :webhook
    skip_before_action :authorize_user, only: [:incoming]

    def incoming
      return render json: {
        "hub.challenge": params["hub.challenge"]
      } if params["hub.challenge"]
    end

    def webhook
      credentials = User::Credential
        .find_by(athlete_id: webhooks_parameters.owner_id)

      activity = Strava::Activities
        .get_one(webhooks_parameters.object_id, credentials.access_token)

      p activity

      return render json: {}
    end

    private 

    def webhooks_parameters 
      params.permit(:aspect_type, 
                    :event_time, 
                    :object_id, 
                    :object_type, 
                    :owner_id, 
                    :subscription_id)
    end
  end
end
