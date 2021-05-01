class Player
  
  attr_reader :token
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(token)
    @token = token
    Player.all << self
  end
  
end