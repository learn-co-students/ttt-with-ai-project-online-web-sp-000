require_relative '../player.rb'

module Players 
  class Computer < Player 
    def move(board)
      #if corners not taken claim corner 
      #else claim middle 
      #
    end 
  end 
end 

corners in idx = [0, 2, 6, 8]
middle = 4 
leftovers = 1, 3, 5, 7 