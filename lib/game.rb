require 'pry'
require_relative "../lib/board.rb"
class Game 
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board = Board.new)
  @board = board
  @player_1 = player1
  @player_2 = player2
 end 
 
 def current_player
   @board.turn_count % 2 == 0 ? @player_1 : @player_2
 end

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

def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
  
def winner
  if winning_combo = won?
    @winner = @board.cells[winning_combo.first]
  end
end
def won?
  WIN_COMBINATIONS.detect do |winner|
    @board.cells[winner[0]] == @board.cells[winner[1]] && @board.cells[winner[1]] == @board.cells[winner[2]] && (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
  end
end

def turn
  
chosen_play = current_player.move(@board) until @board.valid_move?(chosen_play)

 @board.update(chosen_play, current_player.token)
 
end

def over?
  won? || draw?
end


def draw?
  @board.full? && !won?
end

end