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
  
  # def won?
  #   WIN_COMBINATIONS.detect do |combo|
  #     @board.taken?(combo[0]) && (@board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]])
  #   end 
  #   #status
  # end
  
    def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end
  
  def draw?
    @board.full? == true && won? == false ? true : false
  end 
  
  def over?
    won? || draw? ? true : false
  end 
  
  # def winner
  #   if self.won?
  #     @board.cells[self.won?[0]] 
  #   else 
  #     nil
  #   end 
  # end 
  
  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end
  
  def turn
    puts "Please enter 1 - 9"
    input = self.current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, self.current_player)  
    else 
      self.turn
    end
  end 
  
  def play 
    until self.over?
      self.turn
    end 
   
      
  end 
  
end 
