module Players

  class Computer < Player

    def move(board)
      output = rand(1..9)
      if board.valid_move?(output)
        output.to_s
      else
        move(board)
      end
    end

  end

end
