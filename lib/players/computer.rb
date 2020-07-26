require 'pry'
module Players
  class Computer < Player
    def move(board)
      board.taken?(4) ? index = rand(1..9).to_s : index = 5
      if board.valid_move?(index)
        index
      else
        move(board)
      end
    end
  end
end

#changes
