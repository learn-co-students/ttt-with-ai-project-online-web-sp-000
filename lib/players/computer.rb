require 'pry'
module Players
  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      valid_moves.sample(9).each do |item|
        if board.valid_move?(item)
          # binding.pry
          return item
        end
      end
    end
  end
end
