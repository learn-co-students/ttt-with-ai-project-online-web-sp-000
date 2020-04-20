require 'pry'

module Players
  class Computer < Player

    def move(board)
      next_move(board)
    end

    def next_move(board)
      computer_move = board.cells.index { |cell| cell == " " }
      computer_move += 1
      # binding.pry
    end

  end
end
