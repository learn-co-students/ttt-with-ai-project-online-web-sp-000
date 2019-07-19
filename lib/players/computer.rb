module Players                        #define module Players
  class Computer < Player             #Computer inherits from Player class. Used nested module NAMESPACING here for Computer inside modules Players
    def move(board)                   #returns a valid position for the computer to move. Hard-coded condition base algorithm
      if board.cells[4] == " "        #trys center first
        "5"
      elsif board.cells[0] == " "     #trys corners next
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[1] == " "     #trys middles next
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[7] == " "
        "8"
      end
    end
  end
end
#You can hardcode your logic, things like "On turn 1 always try to go in the middle
#if you can" and if not "try to go in a corner" or any logic tree you can think of.

#You should strive to build computer logic that when the computer plays, the game is unwinnable.
