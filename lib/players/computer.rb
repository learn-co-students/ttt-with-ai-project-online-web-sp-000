module Players
  class Computer < Player

    def move(board)
      if board.position(5) == " "
        "5"
      elsif board.position(1) == " "
        "1"
      elsif board.position(3) == " "
        "3"
      elsif board.position(7) == " "
        "7"
      elsif board.position(9) == " "
        "9"
      elsif board.position(2) == " "
        "2"
      elsif board.position(4) == " "
        "4"
      elsif board.position(6) == " "
        "6"
      elsif board.position(8) == " "
        "8"
      end
    end

  end
end
