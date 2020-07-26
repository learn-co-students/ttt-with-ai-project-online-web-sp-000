module Players
  class Computer < Player

    def move(board)
      # Implement a #move method that accepts
      # a board and returns the move the computer wants to make in the
      # form of a 1-9 string. How the computer decides to make that
      # move is up
      # to you but it must be capable of returning a valid move at some
      # point.
      # binding.pry
      board.cells.each_with_index do |cell, index|
        if cell == " "
          return "#{index+1}"
          board.display
        end
      end
    end

  end
end
