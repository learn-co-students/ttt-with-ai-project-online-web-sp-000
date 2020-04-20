module Players
  class Computer < Player

    def move(board)
      for i in 1..9 do
        return i.to_s if board.valid_move?(i)
      end
      return nil
    end

  end
end
