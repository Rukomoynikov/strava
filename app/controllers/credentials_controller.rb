class CredentialsController < ApplicationController
  include ApplicationHelper

  skip_before_action :authorize_user, only: [:exchange_token]

  def exchange_token
    url = access_token_url(exchange_token_params[:code])
    response = JSON.parse(HTTParty.post(url).body)

    User::Credential
      .where(athlete_id: response["athlete"]["id"])
      .first_or_create
      .update(
        expires_at: response["expires_at"],
        expires_in: response["expires_in"],
        refresh_token: response["refresh_token"],
        access_token: response["access_token"],
      )

    token_command =
      Users::AuthenticateUserCommand.call(response["athlete"]["id"])

    if token_command.success?
      cookies.signed[:user_id] = {
        value: token_command.result, 
        expires: 30.days,
        httponly: true
      }

      redirect_to root_path
    end
  end

  private

  def exchange_token_params
    params.permit(:code, :scope)
  end

end
