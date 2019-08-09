class Game

  
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @board.display
  end
  
  def current_player 
    turn = self.board.turn_count
    if turn.even?
      player_1
    else 
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |array|
      first array[0]
      second = array[1]
      third = array[2]
      (self.board[first] && self.board[second] && self.board[third]) == "X"
      puts array
    end
  end

end