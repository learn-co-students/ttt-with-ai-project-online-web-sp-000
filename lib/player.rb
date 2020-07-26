class Player
  attr_reader :token

  POSSIBLE_MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def initialize(token)
    @token = token
  end

end
