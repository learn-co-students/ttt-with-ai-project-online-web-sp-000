module Players
  class Computer < Player
    def move(board)
      board.cells.each do |slot|
        if slot[4] != " "
          return "5"
        else
          return "9"
        end
      end
    end
  end
end
