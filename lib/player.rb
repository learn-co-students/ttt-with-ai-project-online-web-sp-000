class Player

    attr_reader :token
    #You only need the reader method
    #Because once it's initialized with a token it shouldn't change

    def initialize(token)
        @token = token
    end  

end 