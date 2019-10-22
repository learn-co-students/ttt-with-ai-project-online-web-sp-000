require 'pry'
#Players::Computer class represents a computer player of tic tac toe
#move method accepts board and returns the move the computer wants to make in 1-9 String
    #returns a valid move 
    #avoids infinite loop 
    #we recommend building something that's a more colloquial or condition-based algorithm.
   
module Players
  class Computer < Player
    
    move = nil
  
    def move(board)
      
    end

    def center
      if !@board.taken?("5")
        move = "X"
    end
  end
    
    def corner
      
    end
    
    def middle_end
      
    end
    
    def block
      
    end
    
    def winning_move
      
    end
end
end