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
  [2,4,6]
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end
  
  def current_player
    current_turn = self.board.turn_count.odd? ? player_2 : player_1
  end
  
  def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all? {|index| self.board.cells[index] == "X"} || combination.all? {|index| self.board.cells[index] == "O"}
        return combination
      end
    end
    false
  end
  
  def full?
    self.board.cells.all? {|token| token == "X" || token == "O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || full? || won?
  end
  
  def winner
    
  end

end
