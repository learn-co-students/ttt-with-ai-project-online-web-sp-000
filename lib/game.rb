require "pry"
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
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  
  def current_player
    if @board.turn_count % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combination|
    win1=combination[0]
    win2=combination[1]
    win3=combination[2]

    @board.cells[win1] == @board.cells[win2] && @board.cells[win2] == @board.cells[win3] && @board.cells[win1] != " "
    end  
  end
  
  def draw?
    if !won? && @board.full?
      return true
      elsif !won? && !@board.full?
      return false
      elsif won?
      return false
    end 
  end
  
  def over?
    if won?
    return true
    elsif draw?
      return true
    elsif @board.full?
      return true
    end
  end
  
  def winner
  win_combination=won?
    if win_combination
    winning_location=win_combination[0]
    @board.cells[winning_location]
     else
     nil
    end
  end
  
  def turn
    puts "It's now #{current_player.token}'s turn."
    input = current_player.move(input).to_i
    
    if @board.valid_move?(input)
      @board.update(input,current_player)
    else
      turn
    end
  end
  
  def play
    until over?
      turn
    end 
    if won?
      puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
    end
  end
  
  
end

=begin


=end