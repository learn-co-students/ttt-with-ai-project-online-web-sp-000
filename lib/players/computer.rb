require 'pry'
module Players 
  class Computer < Player 
   def move(board) 
    # binding.pry 
      if board.cells[combo[0]].empty?
        self.turn 
      end 
   end 
     
  end 
end 