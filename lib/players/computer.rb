module Players
# Every player subclass will implement a #move method
# that represents how that type of player makes a move in Tic-tac-toe.
  class Computer < Player

    # Implement a #move method that accepts a board and returns
    # the move the computer wants to make in the form of a 1-9 string.
    # How the computer decides to make that move is up to you
    # but it must be capable of returning a valid move at some point.

    # def x_o_count
    #   x = @cells.count("X")
    #   o = @cells.count("O")
    # end

    # if the computer goes first ("X") it should choose the middle
    def move(board)
      x = @board.count("X")
      o = @board.count("O")

      turn_tracker = @board.x_o_count
        if self.token == "X"
          return "5"
        end
    end

  end


end
