class Player
  attr_reader :token

  def initialize(token = "X")
    @token = token
    @oponent_token = @token == "X" ? "O" : "X"
  end
end
