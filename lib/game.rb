require "pry"
class Game
  
  attr_accessor :board, :player_1, :player_2, :input, :draw_count
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
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
    
    def current_player
      if @board.turn_count % 2 == 0
        @player_1
      else
        @player_2
      end
    end
    
    
    def won?
      WIN_COMBINATIONS.find do |combo|
       if board.taken?(combo[0]+1) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
         return combo
      else
         false
       end
     end
   end
   
   def draw?
     true if !won? && board.full?
   end
   
   def over?
     true if draw? || won?
   end
   
   def winner
     if won?
       winning_combo = won?
     board.cells[winning_combo[0]]
   end
 end
 
 def turn
   @board.display
 puts "Please enter a number 1-9:"
    @input = current_player.move(@board)
    puts @input
    if @board.valid_move?(@input)
      @board.update(@input, current_player)
    else puts "Invalid input, please choose a different position:"
      turn
    end
  end
  
  @@draw_count = 0
  
  def self.draw_count
    @@draw_count
  end
  
  def play
    turn until over? == true
    if won?
      puts "Congratulations #{winner}!"
      @board.display
    elsif draw?
      puts "Cat's Game!"
      @@draw_count += 1
      @board.display
    end
  end
  
  
  
        
  
    
  
end