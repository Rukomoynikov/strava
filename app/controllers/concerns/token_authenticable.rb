# frozen_string_literal: true

class NotAuthorizedException < StandardError; end

module TokenAuthenticable
  extend ActiveSupport::Concern

  included do
    attr_reader :current_user

    before_action :authenticate_user, :authorize_user

    rescue_from NotAuthorizedException,
                with: lambda {
                  # render json: { error: 'Not Authorized' }, status: :unauthorized }
                  redirect_to root_url,
                              alert:
                                'You cannot access that part of the website.',
                              status: :unauthorized
                }
  end

  private

  def authenticate_user
    @current_user =
      Users::DecodeAuthenticationCommand.call(
        headers: request.headers, cookies: cookies.signed[:user_id]
      ).result
    @profile = @current_user.user_profile
  end

  def authorize_user
    raise NotAuthorizedException unless @current_user
  end
end
