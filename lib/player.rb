class Player

  attr_accessor :game, :name, :opponent_token
  attr_reader :token

  def initialize(token="X")
    @token = token
    if self.token == "X"
      @opponent_token = "O"
    else
      @opponent_token = "X"
    end
  end

end
