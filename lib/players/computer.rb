
module Players
  class Computer < Player

    def move(board)
      all_moves = (1..9).to_a.map(&:to_s)
      all_moves.sample
    end

  end
end
