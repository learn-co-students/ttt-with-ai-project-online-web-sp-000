class Player
  # has a token and a move that upates per turn
  attr_reader :token

  # starts w/ token depending on being player 1 or player 2
  def initialize(token)
    @token = token
  end
end
