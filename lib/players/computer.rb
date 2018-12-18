module Players

  class Computer < Player

    def move(board)
      choices = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      input = choices[rand(9)]
    end

  end

end
