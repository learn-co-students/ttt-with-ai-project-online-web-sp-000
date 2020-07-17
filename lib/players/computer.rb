require 'pry'
module Players
  class Computer < Player
    def move(board)
      # binding.pry
      index = board.cells.find_index{|cell| cell == " "}
      input = (index + 1).to_s
      return input
    end
  end
end
