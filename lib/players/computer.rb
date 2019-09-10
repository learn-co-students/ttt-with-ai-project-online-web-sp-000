module Players
  class Computer < Player
    def move (board)
      if board.turn_count == 0
        ["1", "3", "5", "7", "9"].sample
      elsif board.turn_count == 1
        if board.taken?("5")
          ["1", "3", "7", "9"]
        else
          "5"
        end
      else
        rand(1..9)
      end
    end
  end
end
