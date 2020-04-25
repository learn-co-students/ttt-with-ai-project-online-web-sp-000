module Players
  
  class Computer < Player
    
    def move(board)
      input = "1"
      if board.cells[0] == " "
        input
        elsif board.cells[1] == " "
        input = "2"
        elsif board.cells[2] == " "
        input = "3"
        elsif board.cells[3] == " "
        input = "4"
        elsif board.cells[4] == " "
        input = "5"
        elsif board.cells[5] == " "
        input = "6"
        elsif board.cells[6] == " "
        input = "7"
        elsif board.cells[7] == " "
        input = "8"
        elsif board.cells[8] == " "
        input = "9"
      end
    end
        
    # def move(board)
    #   input = "1"
    #   if board.taken?(input) == false
    #     input
    #   else
    #     input += 1
    #     move(board)
    #   end
    # end
    
  end
  
end