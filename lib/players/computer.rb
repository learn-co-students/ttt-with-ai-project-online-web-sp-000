module Players 
  class Computer < Player 
   def move(board) 
     new_number = (rand(1..9))
      if !board.taken?(new_number)
        return new_number
      end 
   end 
     
  end 
end 