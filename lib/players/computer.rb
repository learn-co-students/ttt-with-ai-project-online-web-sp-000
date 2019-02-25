require "pry"

module Players
  class Computer < Player 
    
    def move(board)
      if board.taken?("5")
         board.update("5", self)
         return "5"
      elsif !board.taken?("1")
            board.update("1", self)
            return "1"
      elsif !board.taken?("3")
            board.update("3", self)
            return "3"
      elsif !board.taken?("7")
            board.update("7", self)
            return "7"
      elsif !board.taken?("9")
            board.update("9", self)
            return "9"
      elsif !board.taken?("2")
            board.update("2", self)
            return "2"
      elsif !board.taken?("8")
            board.update("8", self)
            return "8"
      elsif !board.taken?("4")
            board.update("4", self)
            return "4"
      elsif !board.taken?("6")
            board.update("6", self)
            return "6"
      end
    end
    
  end
end