module Players
  class Computer < Player
    def move(board)
      positions = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      move = nil
      while move.nil?
        funky = positions.sample
        move = !board.taken?(funky) ? funky : nil
        positions.delete(funky)
      end
      move
    end
  end
end
