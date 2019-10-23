module Players
  class Computer < Player
    
   def move(board)
     index = rand(1..9)
     if !board.taken?(index)
       move = index.to_s
   end
 end
   
end
end