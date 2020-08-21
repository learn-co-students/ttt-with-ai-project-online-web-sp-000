
#act as inheritance point for actual player classes
class Player
    attr_reader :token
    # have token that can be set upon initialization
    # every player subclass will implement move method representing how player makes move

    def initialize(token)
        @token = token
    end
end