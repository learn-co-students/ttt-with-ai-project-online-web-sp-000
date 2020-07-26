module Players

  class Computer < Player

    def move(board)
      if !board.taken?("5")
        input = "5"
      elsif !board.taken?("1") || !board.taken?("3") || !board.taken?("7") || !board.taken?("9")
        input = ["1", "3", "7", "9"][rand(4)]
      elsif !board.taken?("2") || !board.taken?("4") || !board.taken?("6") || !board.taken?("8")
        input = ["2", "4", "6", "8"][rand(4)]
      end
    end

  end

end
