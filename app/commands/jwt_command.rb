# frozen_string_literal: true

class JwtCommand
  SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload)
    JWT.encode(payload, SECRET, 'HS256')
  end

  def self.decode(token)
    body, = JWT.decode(token, SECRET, true, algorithm: 'HS256')
    HashWithIndifferentAccess.new(body)
  rescue JWT::ExpiredSignature
    nil
  rescue JWT::VerificationError
    nil
  end
end
