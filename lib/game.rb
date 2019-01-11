class Game
  ##`WIN_COMBINATIONS`
# Define a `WIN_COMBINATIONS` constant within the `TicTacToe` class, and set it equal to a nested array filled with the
# index values for the various winning combinations possible in Tic Tac Toe.
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =
    [[0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    #player_1 needs to access the Players module and then the Human who is playing as "X", then makes a new instance when needed
    #player_2 needs to access the Players module and then the Computer who is playing as "O", then makes a new instance when needed
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

end
