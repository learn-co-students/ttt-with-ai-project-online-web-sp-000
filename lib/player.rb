class Player

  attr_accessor :game, :name, :opponent_token, :my_last_move, :board
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
