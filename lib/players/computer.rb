require 'pry'
module Players
  class Computer < Player

    def move(board)
      if board.cells[4] == " "
        return "5"
      elsif board.cells[0] == " "
        return "1"
      elsif board.cells[8] == " "
        return "9"
      elsif board.cells[6] == " "
        return "7"
      elsif board.cells[2] == " "
        return "3"
      else 
        slot = board.cells.find {|cell| cell == " "}
        slot_num = board.cells.index(slot) + 1
        move = slot_num.to_s
      end
    end
    
  end
end