class Player

    attr_reader :token

    # Each time a new player is instantiated, they're assigned a token, whether "X" or "O".
    def initialize(token)
        @token = token
    end

end