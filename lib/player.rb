class Player
    attr_reader :token
    def initialize(token)
        @token = token
        @token.freeze
    end
end