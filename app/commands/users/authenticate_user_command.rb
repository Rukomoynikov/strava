module Users
  class AuthenticateUserCommand < BaseCommand
    private

    attr_reader :athlete_id

    def initialize(athlete_id)
      @athlete_id = athlete_id
    end

    def payload
      @result = JwtCommand.encode(contents)
    end

    def contents
      { user_id: athlete_id }
    end
  end
end
