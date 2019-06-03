require 'pry'
module Players 
  class Computer < Player 
   def move(board) 
   
      if !board.taken?(4)
        return "5" 
      end 
   end 
     
  end 
end 