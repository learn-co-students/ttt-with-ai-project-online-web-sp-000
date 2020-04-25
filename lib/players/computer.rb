require 'pry'

module Players
  class Computer < Player
    def move(board)
      #random for now
      #binding.pry
      my_move = rand(8)+1
      my_move.to_s
    end
  end
end
