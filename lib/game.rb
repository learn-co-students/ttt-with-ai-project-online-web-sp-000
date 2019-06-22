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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
   @player_1 = player_1
   @player_2 = player_2
   @board = board
  end

  def update_position(integer)
    @board.cells[integer.to_i - 1] = current_player.token
  end



  def current_player
    if board.turn_count.odd?
      player_2
    else
      player_1
    end
  end

  def position_taken?(integer)
   if @board.cells[integer] == " " || @board.cells[integer] == "" || @board.cells[integer] == nil
    false
  elsif @board.cells[integer] == "X" || @board.cells[integer] == "O"
    true
   end
  end



  def won?
    WIN_COMBINATIONS.detect{|combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && position_taken?(combo[0])}
  end

  def full?
   if @board.cells.include?(' ') || @board.cells.include?('')
    return false
   else
    return true
   end
  end

  def draw?
   if !won? && full?
    return true
   else won?
    return false
   end
  end

  def over?
   if draw? || full? || won?
    true
   else
    false
   end
  end

  def winner
    win_combo = won?
   if win_combo
    @board.cells[win_combo[0]]
   else
    nil
   end
  end

  def turn
   puts "Please enter 1-9:"
   user_input = current_player.move(@board)
   if @board.valid_move?(user_input)
     index = update_position(user_input)
   else
    turn
   end
  end

  def play
    until over?
     turn
    end
    if winner == "X"
     puts "Congratulations X!"
    elsif winner == "O"
     puts "Congratulations O!"
    else
     puts "Cat's Game!"
    end
  end
end
