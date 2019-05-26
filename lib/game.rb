class Game 
  attr_accessor :board 
  
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [0, 3, 6],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  [6, 7, 8],
  [1, 4, 7]
  
  ]
  
  def initialize(player_1 = "X", player_2 = "O", board)
    
  end 
  
  
  def board 
    @board
  end 
  
  
  
  
  
end 