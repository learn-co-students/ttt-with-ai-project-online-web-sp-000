module Players
  class Computer < Player
    def move(board)
      input = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
      if board.valid_move?(input.to_i)
        board.update(input,self)
        input
      else
        move(board)
      end
    end
  end
end