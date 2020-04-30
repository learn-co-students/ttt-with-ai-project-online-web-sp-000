class Board
  
  attr_accessor :cells
  
  def initialize
    self.reset!
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
end
  
