require 'pry'
module Players 
  class Computer < Player 
   def move(board) 
     #binding.pry 
      if board.cells.include?(" ")
        self.Board.update 
      else
        nil  
      end 
   end 
     
  end 
end 