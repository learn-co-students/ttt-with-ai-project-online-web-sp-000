module Players
  class Computer < Player

    def move(board)
      if board.empty?(4)
        "5"
      elsif board.empty?(0)
        "1"
      elsif board.empty?(2)
        "3"
      elsif board.empty?(6)
        "7"
      elsif board.empty?(8)
        "9"
      elsif board.empty?(1)
        "2"
      elsif board.empty?(3)
        "4"
      elsif board.empty?(5)
        "6"
      elsif board.empty?(7)
        "8"
      end
    end
  end
end
