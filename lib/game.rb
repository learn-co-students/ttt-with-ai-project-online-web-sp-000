require "pry"
class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end
  
  def draw?
    @board.full? && !won?
  end 
  
  def over?
    won? || draw?
  end 
  
  def winner
    if self.won?
      @board.cells[self.won?[0]] 
    end 
  end 
  
  def turn
    @board.display
    puts "Please enter 1 - 9"
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)  
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
    else
      puts "Cat's Game!"
    end 
  end 
  
end 
