require 'pry'
class Game

  include GenMethods

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.cells.count {|v| v != " "} % 2 == 0 ? @player_1 : @player_2
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    over? ? @board.cells[won?[0]] : nil
  end

  def turn
    puts "It is now #{current_player.token}'s turn."
    var = current_player.move(@board).to_i
    if @board.valid_move?(var)
      @board.update(var, current_player)
      @board.display
    elsif var.between?(1, 9) == false
      puts "Invalid move."
      turn
    else
      puts "Position taken."
      turn
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end
