class Game
  
  attr_accessor :board, :player_1, :player_2
  
  def initialize (board)
    @board = Board.new
    @player_1 = Player.new(X)
    @player_2 = Player.new(Y)
  end
  
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
  
end