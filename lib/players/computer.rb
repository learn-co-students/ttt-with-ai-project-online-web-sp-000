module Players

class Computer < Player 
 
  def move(board)
    
   avail_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
   
   comp_choice = rand(8) 
   
   return avail_moves[comp_choice]
    
    
  end 
  
end 

end 
    