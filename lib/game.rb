require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
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

  def initialize(player_1 = nil, player_2 = nil , board = nil )
    player_1.nil? ? @player_1 = Players::Human.new("X") : @player_1 = player_1
    player_2.nil? ? @player_2 = Players::Human.new("O") : @player_2 = player_2
    board.nil? ? @board = Board.new : @board = board
  end

 def current_player
   board.turn_count.even? ? player_1 : player_2
 end

 def won?
   WIN_COMBINATIONS.detect do |combo|
    board.cells[combo[0]] == board.cells[combo[1]] &&
    board.cells[combo[1]] == board.cells[combo[2]] &&
    board.cells[combo[0]] != " "
  end
 end

 def draw?
   board.full? && !won? ? true : false
 end

 def over?
  draw? || won?
 end

 def winner
   won? ? board.cells[won?[0]] : nil
 end

 def turn
   move = current_player.move(board)
   until board.valid_move?(move)
     move = current_player.move(board)
   end
   board.update(move, current_player)
 end

 def play
   until over?
     turn
     board.display
     puts
   end
   if winner
     puts "Congratulations #{winner}!"
   else
     puts "Cat's Game!"
   end
 end
end
