module Players
  class Computer < Player

    def move(board)
      if board.cells[0] == " "
        1.to_s
      elsif board.cells[1] == " "
        2.to_s
      elsif board.cells[2] == " "
        3.to_s
      elsif board.cells[3] == " "
        4.to_s
      elsif board.cells[4] == " "
        5.to_s
      elsif board.cells[5] == " "
        6.to_s
      elsif board.cells[6] == " "
        7.to_s
      elsif board.cells[7] == " "
        8.to_s
      elsif board.cells[8] == " "
        9.to_s
      end
    end
  end
end
