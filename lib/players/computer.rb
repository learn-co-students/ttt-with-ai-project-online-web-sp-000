module Players
  class Computer < Player

    def move(board)
      position = rand(1..9)
      if board.valid_move?(position)
        board.update(position, self)
        board.display
        position.to_s
      else
        self.move(board)
      end
    end

  end
end