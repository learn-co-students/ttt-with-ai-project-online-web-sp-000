module Players
  class Computer < Player
    def move(board)
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      else
        rand(10).to_s
      end
    end
  end
end


### create more intelligent game playing here
