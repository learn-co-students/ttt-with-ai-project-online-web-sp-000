require 'pry'

module Players

  class Computer < Player

    def move(board)
      if board.turn_count && !board.taken?
    end
  end
end
