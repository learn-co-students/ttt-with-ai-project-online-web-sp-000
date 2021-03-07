require 'pry'
module Players
  class Computer < Player
    def move(board)
     move = nil

     if !board.taken?(5)
       move = "5"

     elsif !board.taken?(1)
       move = "1"

     elsif (board.position(1) == board.position(3) || board.position(5) == board.position(8)) && !board.taken?(2)
       move = "2" 
     elsif (board.position(5) == board.position(2) || board.position(7) == board.position(9)) && !board.taken?(8)
       move = "8"
     elsif (board.position(5) == board.position(6) || board.position(1) == board.position(7)) && !board.taken?(4)
       move = "4"
     elsif (board.position(4) == board.position(5) || board.position(3) == board.position(9)) && !board.taken?(6)
       move = "6"
     elsif (board.position(3) == board.position(5) || board.position(8) == board.position(9)) && !board.taken?(7)
       move = "7"
     elsif (board.position(1) == board.position(2) || board.position(6) == board.position(9)) && !board.taken?(3)
      move = "3"
    else
      
      end
    end


  end

end
