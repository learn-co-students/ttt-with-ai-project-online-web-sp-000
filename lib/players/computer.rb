module Players
# Every player subclass will implement a #move method
# that represents how that type of player makes a move in Tic-tac-toe.
  class Computer < Player
    attr_accessor :board

    # Implement a #move method that accepts a board and returns
    # the move the computer wants to make in the form of a 1-9 string.
    # How the computer decides to make that move is up to you
    # but it must be capable of returning a valid move at some point.

    # def x_o_count
    #   x = @cells.count("X")
    #   o = @cells.count("O")
    # end

    # inside #move, board = #<Board:0x0000000003364838 @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
    # inside #move, @board and @cells are nil

    # ------ Strategy ------
    # if the computer goes first (token "X") it should choose the middle
    # if there's an O on the board, the computer should choose a place next to it
    # if the computer has 2 neighboring tokens on the board, it should choose the 3rd spot to win
    def move(board)
      # binding.pry
      # x = @cells.count("X")
      # o = @cells.count("O")
      #
      # turn_tracker = @cells.x_o_count
        # if the computer goes first (token "X") it should choose the middle
        if self.token == "X"
          return "5"
        # elsif self.token == "O"
        #   return ""
        end

    end



    # class end
  end

  # module end
end
