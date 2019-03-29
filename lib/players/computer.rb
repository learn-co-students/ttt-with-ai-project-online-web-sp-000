module Players
  class Computer < Player

    def move(board)
      if !board.taken?(rand(1..9).to_i)
        rand(1..9).to_s
      end
    end

  end
end
