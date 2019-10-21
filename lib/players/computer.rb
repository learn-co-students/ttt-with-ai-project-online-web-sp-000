require 'pry'
#Players::Computer class represents a computer player of tic tac toe
#move method accepts board and returns the move the computer wants to make in 1-9 String
    #returns a valid move 
    #avoids infinite loop 
    #we recommend building something that's a more colloquial or condition-based algorithm.
   
module Players
  class Computer < Player
    
    def move(board)
     move = nil
     #if bottom left isnt taken, move, else take top left
     #if top left isn't taken, move, else take bottom right
     #if bottom right isn't taken, move, else take top right
     #
     
  end
    
  end
end