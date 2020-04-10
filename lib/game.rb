require 'pry'

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
  [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count.even?
      return @player_1
    else
      return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.find do |combination|
      position_1 = combination[0]
      position_2 = combination[1]
      position_3 = combination[2]
      board.cells[position_1] == board.cells[position_2] &&
      board.cells[position_2] == board.cells[position_3] &&
      board.taken?(position_1 + 1)
    end
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      index = input.to_i - 1
      board.cells[index] = current_player.token
    elsif !board.valid_move?(input)
    input = current_player.move(board)
    end
  end

  def play
    turn until over?
    if over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
  end

end
