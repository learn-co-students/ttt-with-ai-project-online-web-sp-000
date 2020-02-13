class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], #left column
  [1,4,7], # middle column
  [2,5,8], #right column
  [0,4,8], #diagonal 1
  [2,4,6] #diagonal 2
  ]
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    #@board.display
  end

  def current_player
     board.turn_count.odd? ? player_2 : player_1
  end
  
  def won?
     WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? { |win_index| board.cells[win_index] == "X" } ||
    win_combination.all? { |win_index| board.cells[win_index] == "O" }
  end
  end
  
  def full?
  board.cells.each {|a| return false if a == " "}
  end

  def draw?
    if !won? && full?
   return true 
  end
end

def over?
  if won? || full? || draw?
    return true
  end
end

def winner
  win = won?
    if win
      return board.cells[win[0]]
  end
end

def turn
  
end


end