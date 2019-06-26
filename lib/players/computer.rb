module Players
  class Computer < Player
    def move(board)
      i = 1
      while i <= 9 do
        if board.valid_move?(i.to_s)
          return i.to_s
        else
          i += 1
        end
      end
    end
  end
end