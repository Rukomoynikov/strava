module User
  class CredentialsController < ApplicationController
    include ApplicationHelper

    skip_before_action :authorize_user, only: [:new]


    # When user accepts Strava authorization it will redirect them 
    # to that page with exchange_token_params params. 
    # Then need
    def new
      access_token_command = 
        Users::GetAccessTokenCommand.call(exchange_token_params[:code])

      athlete_id = access_token_command.result["athlete"]["id"]

      jwt_token_command =
        Users::AuthenticateUserCommand.call(athlete_id)


      if jwt_token_command.success?
        cookies.signed[:user_id] = {
          value: jwt_token_command.result, 
          expires: 30.days,
          httponly: true
        }

        redirect_to root_path
      end
    end

    private

    def exchange_token_params
      params.permit(:code, :scope, :state)
    end
  end
end
