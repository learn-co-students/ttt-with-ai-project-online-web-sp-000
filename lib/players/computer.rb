require 'pry'
module Players
  class Computer < Player
  #  binding.pry
  #  @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    def move(board)
      move = nil
      if board.cells[4] = " "
        move = "5"
      elsif board.cells[0] = " "
        move = "1"
      elsif board.cells[2] = " "
        move = "3"
      elsif board.cells[6] = " "
        move = "7"
      elsif board.cells[8] = " "
        move = "9"
      elsif board.cells[1] = " "
        move = "2"
      elsif board.cells[3] = " "
        move = "4"
      elsif board.cells[5] = " "
        move = "6"
      elsif board.cells[7] = " "
        move = "8"
      end
    end
  end
end
