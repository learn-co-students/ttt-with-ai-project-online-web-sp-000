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

  def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"),board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
   if board.turn_count.even? then player_1
   else player_2
   end
 end

 def won?
  WIN_COMBINATIONS.each do |win_combination|
    if @board.cells[win_combination[0]] == "X" && @board.cells[win_combination[1]] == "X" && @board.cells[win_combination[2]] == "X"
      return win_combination
    elsif
      @board.cells[win_combination[0]] == "O" && @board.cells[win_combination[1]] == "O" && @board.cells[win_combination[2]] == "O"
      return win_combination
    else
      false
    end
  end
  false
end

def full?
  @board.cells.none?{|space| space == " "}
  end

  def draw?
  won? == false && full? == true
  end

  def over?
    won? || draw?
  end

  def winner
    if won? == false then nil else
    win_array = won?
    @board.cells[win_array[0]]
  end
  end

  def turn
  puts "Please enter 1-9:"
  move = current_player.move(@board)
  if board.valid_move?(move)
    board.update(move,current_player)
    board.display
  else turn
  end
end

def play
while over? == false
  turn
end
if draw? == true then puts "Cat's Game!"
else puts "Congratulations #{winner}!"
end
end

end
