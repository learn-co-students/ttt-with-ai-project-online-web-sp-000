module Players

  class Computer < Player

    def move(board)
      input = optimal_move(board)
      while board.valid_move?(input) == true
        input = optimal_move(board)
      end
      return input.to_s
    end


    def optimal_move(board)
      if !board.taken?(5)
        return 5
      elsif !board.taken?(1)
        return 1
      elsif !board.taken?(3)
        return 3
      elsif !board.taken?(7)
        return 7
      elsif !board.taken?(9)
        return 9
      else
        return rand(1..9)
      end
    end

  end

end
