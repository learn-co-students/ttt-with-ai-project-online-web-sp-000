module Players
  class Computer < Player
    def move(board)
      #input = gets
      position = 0
      while 0
        position = rand(9) + 1
        break if !board.taken?(position)
      end
      position.to_s
    end
  end
end
