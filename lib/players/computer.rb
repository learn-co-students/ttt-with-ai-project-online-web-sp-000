require_relative '../player.rb'

module Players 
  class Computer < Player 
    def move(board)
      #if corners not taken claim corner 
      #else claim middle 
      if(board.(1) == self.token && board.(3) == self.token)
        "2"
      elsif (board.position(1) == self.token && board.(7) == self.token)
        "4"
      elsif (board.(1) == self.token && board.(9) == self.token)
        "5" 
      elsif (board.(3) == self.token && board.(9) == self.token)
        "6"
      elsif (board.(7) == self.token && board.position(9) == self.token)
        "8"
      elsif (board.position(3) == self.token && board.position(7) == self.token)
        "5"
      elsif !(board.taken?(1))
        "1" 
      elsif !(board.taken?(3))
        "3"
      elsif !(board.taken?(7))
        "7" 
      elsif !(board.taken?(9))
        "9"
      elsif !(board.taken?(5))
        "5"
      elsif !(board.taken?(2))
        "2"
      elsif !(board.taken?(4))
        "4"
      elsif !(board.taken?(6))
        "6"
      elsif !(board.taken?(8))
        "8" 
      end 
    end
  end 
end 
# def taken?(str)
#   position(str) != " " && position(str) != ""
# end
# corners in str = [1, 3, 7, 9]
# middle str = 5 
# leftovers str = [2, 4, 6, 8]
