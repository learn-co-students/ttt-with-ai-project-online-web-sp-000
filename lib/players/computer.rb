module Players
# Every player subclass will implement a #move method
# that represents how that type of player makes a move in Tic-tac-toe.
  class Computer < Player
    attr_accessor :board

    # Implement a #move method that accepts a board and returns
    # the move the computer wants to make in the form of a 1-9 string.
    # How the computer decides to make that move is up to you
    # but it must be capable of returning a valid move at some point.
    # ------ Strategy ------
    # if the computer goes first (token "X") it should choose the middle
    # if there's an O on the board, the computer should choose a place next to it
    # if the computer has 2 neighboring tokens on the board, it should choose the 3rd spot to win
    def move(board)
      # hard-coded moves that favor the middle, corners then other spaces
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[7] == " "
        "8"
      end

      # def end
      end
    # class end
  end
  # module end
end

# more strategic #move to implement later
# turn_tracker = @board.turn_count
# if the computer goes first (token "X") it should choose the middle
# if self.token == "X"
#   if turn_tracker == 0
#     return "5"
#   # check the corners, pick an empty one.
#     elsif turn_tracker == 2
#       !@board.taken?("1") || !@board.taken?("3") || !@board.taken?("7") || !@board.taken?("9")
#       # @board.cells.each do |X|
#         return @board.taken?("1")
#     elsif turn_tracker == 4
#         !@board.taken?("9")
#         return "9"
#     else return "8"
#     end
# end
