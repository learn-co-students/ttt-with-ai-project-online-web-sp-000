=begin
Harcoded logic:
"On turn 1 always try to go in the middle if you can"
and if not "try to go in a corner"
I would be nice to implement an algorithm called Min/Max
=end
module Players

  class Computer < Player
    def move(board)
      if board.turn_count == 0
        "5"
      elsif board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      end
    end
  end

end
