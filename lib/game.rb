class Game
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  WIN_COMBINATIONS = [
     [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
  
  def board
    board = @board
  end
  
  def player_1
    @player_1
  end
  
  def player_2
    @player_2
  end
  
  def current_player
     if board.turn_count.even?
       "X"
    else 
       "O"
  end
  end
  
  #main model of app
  #represents a singular instance of tic tac toe session:
    #game has one board through board property
    #game has two Players stored in player_1 & player_2
  #Board & Player don't directly relate to Game but collaborate through arguments
  #provides basic game runtime and logic(see tests)
end