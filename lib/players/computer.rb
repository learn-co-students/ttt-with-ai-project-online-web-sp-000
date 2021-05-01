module Players
  class Computer < Player

    def initialize(token)
      super(token)
    end

    def move(board)
      if board.turn_count == 0 || !board.taken?("5")
        return "5"
      end

      if board.turn_count == 1 || board.turn_count == 2
        return !board.taken?("3") ? "3" : "1"
      end

      (rand(8) + 1).to_s
    end
  end
end
