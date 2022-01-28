# frozen_string_literal: true

class DecodeAuthenticationCommand < BaseCommand
  private

  attr_reader :headers

  def initialize(params)
    @headers = params[:headers]
    @cookies_user = params[:cookies]
    @user = nil
  end

  def payload
    return unless token_present?

    @result = user if user
  end

  def user
    @user ||= User::Credential.find_by(athlete_id: decoded_id)
    @user ||
      errors.add(
        :token,
        I18n.t('decode_authentication_command.token_invalid')
      ) &&
        nil
  end

  def token_present?
    token.present? && token_contents.present?
  end

  def token
    return authorization_header.split(' ').last if authorization_header.present?
    return @cookies_user if @cookies_user.present?

    errors.add(:token, I18n.t('decode_authentication_command.token_missing'))
    nil
  end

  def authorization_header
    @headers['Authorization']
  end

  def token_contents
    @token_contents ||=
      begin
        decoded = JwtCommand.decode(token)
        unless decoded
          errors.add(
            :token,
            I18n.t('decode_authentication_command.token_expired')
          )
        end
        decoded
      end
  end

  def decoded_id
    token_contents['user_id']
  end
end
