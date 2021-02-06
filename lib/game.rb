class Game
  
  attr_accessor :player_1, :player_2, :board
  
  # Define Winning Combinations Constant
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
    
   def initialize (p1 = player_1, p2 = player_2, b = [" "," ", " "," "," "," "," "," "," "])
    @player_1 = p1
    @player_2 = p2
    @board = b
  end

end

