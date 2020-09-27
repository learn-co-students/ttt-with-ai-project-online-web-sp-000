module Players #here we have an overriding module class Players that wraps around the entire class, and then:
  class Computer < Player  #this 'class Computer' inherits all of the functionality from the Player module that we have 
    def move(board)
      if board.cells[0] == " " || ""
        "1"
      elsif board.cells[1] == " " || ""
        "2"
      elsif board.cells[2] == " " || ""
        "3"
      elsif board.cells[3] == " " || ""
        "4"
      elsif board.cells[4] == " " || ""
        "5"
      elsif board.cells[5] == " " || ""
        "6"
      elsif board.cells[6] == " " || ""
        "7"
      elsif board.cells[7] == " " || ""
        "8"
      elsif board.cells[8] == " " || ""
        "9"
      end 
    end 
  end
end 