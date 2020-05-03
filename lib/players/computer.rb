module Players
  class Computer < Player
    def move(board)
      n = true
      valid_moves = ["1","2","3","4","5","6","7","8"]
      i = 0
      while n
        return move = valid_moves[i]
        i += 1
      end
    end
  end
end