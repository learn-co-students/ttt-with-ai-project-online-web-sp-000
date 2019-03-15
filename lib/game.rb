class Game
  require "pry"

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

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
end

def current_player
self.board.turn_count.even? ? self.player_1 : self.player_2
end

def won?
  #binding.pry
  result = nil
WIN_COMBINATIONS.each do |sub_array|
    index_1 = sub_array[0]
    index_2 = sub_array[1]
    index_3 = sub_array[2]

    board_index_1 = self.board.cells[index_1]
    board_index_2 = self.board.cells[index_2]
    board_index_3 = self.board.cells[index_3]
 if (board_index_1 == "X" && board_index_2 == "X" && board_index_3 == "X") || (board_index_1 == "O" && board_index_2 == "O" && board_index_3 == "O")
  result = sub_array
end
end
result
end

def draw?
    if won?
      false
    elsif !self.board.full?
      false
    else
      puts "Cat's Game!"
      true
  end
end

def over?
   if draw?
     return true
  elsif won?
    return true
  else
    false
  end
end

def winner
  sub_array = won?
    if won? == nil
    nil
    elsif self.board.cells[sub_array[1]] == "X"
    "X"
   elsif self.board.cells[sub_array[1]] == "O"
    "O"
  end
end

def turn
  input = self.current_player.move(self.board).to_i
  player = current_player
  if self.board.valid_move?(input)
    self.board.update(input, player)
    self.board.display
  else
    turn
  end
end


  def play
    turn until over?
      if draw?
        puts "Cat's Game!"
      elsif over?
        puts "Congratulations #{winner}!"
      end
  end

end
