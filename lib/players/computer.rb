require 'pry'

module Players
  class Computer < Player

    def move(board)
     move = rand(1..9)
     #binding.pry
     if !board.taken?(move)
       return move.to_s

    end
  end


  end
end
