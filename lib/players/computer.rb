module Players
  class Computer < Player #Inherits all the functionality that we have in the Player module

    def move(board)
      if board.cells[4] == " "      #tried center first
        "5"
      elsif board.cells[0] == " "   #then tried corners
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[1] == " "   #then tried middle
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
