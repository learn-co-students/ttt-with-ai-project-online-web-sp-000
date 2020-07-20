
module Players
  class Computer < Player
    def move(board)
      index = board.cells.find_index{|cell| cell == " "}
      input = (index + 1).to_s
    end
  end
end
