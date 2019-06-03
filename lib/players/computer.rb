module Players
    class Computer < Player
       def move(board)
        valid_moves = ("1".."9").to_a
        valid_moves.sample
      #  binding.pry
      
        
        
       end 
    

    



    end 
end 