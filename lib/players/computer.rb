module Players

  class Computer < Player
    
    def move(board)
 
      #winning moves
      if board.cells[0] != " " && board.cells[2] != " " && board.cells[1] == " "
         a = "2"
         
      elsif board.cells[3] != " " && board.cells[5] != " " && board.cells[4] == " "
         a = "5"
       
      elsif board.cells[6] != " " && board.cells[8] != " " && board.cells[7] == " "
         a = "8"
      
      elsif board.cells[0] != " " && board.cells[6] != " " && board.cells[3] == " "
         a = "4"
     
      elsif board.cells[2] != " " && board.cells[8] != " " && board.cells[5] == " "
         a = "6"
      
      elsif board.cells[1] != " " && board.cells[7] != " " && board.cells[4] == " "
         a = "5"
      
      elsif board.cells[0] != " " && board.cells[8] != " " && board.cells[4] == " "
         a = "5"
      
      elsif board.cells[2] != " " && board.cells[6] != " " && board.cells[4] == " "
         a = "5"
      else r = rand(0..8)
        board.cells[r] == " "
        a = r + 1
        
      end
    end
    
  end

end
  