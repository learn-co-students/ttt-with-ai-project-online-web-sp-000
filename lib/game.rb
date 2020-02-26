class Game
  attr_accessor :board
  attr_reader :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,4,8], # left diagonal
    [2,4,6], # right diagonal
    [0,3,6], # left col
    [1,4,7], # middle col
    [2,5,8] # right col
  ]

  def player_1=(player_1)
    @player_1 = player_1
  end

  def player_2=(player_2)
    @player_2 = player_2
  end

  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

end
