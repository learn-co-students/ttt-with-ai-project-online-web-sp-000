class Player
  
  attr_reader :token
  
  @@all = []
  
  def initialize(token)
    @token = token
    self.save
  end
  
  def self.all 
    @@all 
  end 
  
  def save
    @@all << self 
  end 
  
end 