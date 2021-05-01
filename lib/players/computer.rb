
require "pry"
module Players
      
      
      class Computer < Player
        # your code here
        
   
        def move(board)
 
        m = rand(9) + 1 
        
        if board.valid_move?(m) 
         m.to_s
        else
        self.move
        end 
        
        
        end 
        end
      
      

end 