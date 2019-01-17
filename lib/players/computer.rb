module Players
  class Computer < Player
    def move(board)
      options = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      user_input = options.sample
    end
  end
end
