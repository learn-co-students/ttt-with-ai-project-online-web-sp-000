module Players
  class Computer < Player

    VALIDMOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    def move(board)
      VALIDMOVES.sample
    end
  end
end
