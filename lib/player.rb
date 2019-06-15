class Player
  extend Player::Human
  
  attr_reader :token
  
  def initialize(token)
    @token = token
  end
  
end