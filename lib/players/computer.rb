module Players

class Computer < Player 
 
  def move(board)
    
    
    win_combos = [[0, 1, 2],[3, 4, 5],[6 ,7 ,8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0,4, 8],[2, 4, 6]]
    
   avail_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
   comp_choice = rand(8)
   
   if (board.cells[0] != " " && board.cells[1] != " " && board.cells[2] == " ") || (board.cells[4] != " " && board.cells[6] != " " && board.cells[2] == " ") ||   (board.cells[5] != " " && board.cells[8] != " " && board.cells[2] == " ")
          return avail_moves[2]
          
    elsif (board.cells[0] != " " && board.cells[8] != " " && board.cells[4] == " ") || (board.cells[1] != " " && board.cells[7] != " " && board.cells[4] == " ") ||   (board.cells[3] != " " && board.cells[5] != " " && board.cells[4] == " ") || (board.cells[2] != " " && board.cells[6] != " " && board.cells[4] == " ")
          return avail_moves[4]
          
    elsif (board.cells[1] != " " && board.cells[2] != " " && board.cells[0] == " ") || (board.cells[4] != " " && board.cells[8] != " " && board.cells[0] == " ") ||   (board.cells[3] != " " && board.cells[6] != " " && board.cells[0] == " ")
         return avail_moves[0]
         
     elsif (board.cells[0] != " " && board.cells[3] != " " && board.cells[6] == " ") || (board.cells[2] != " " && board.cells[4] != " " && board.cells[6] == " ") ||   (board.cells[7] != " " && board.cells[8] != " " && board.cells[6] == " ")
         return avail_moves[6] 
         
      elsif (board.cells[2] != " " && board.cells[5] != " " && board.cells[8] == " ") || (board.cells[0] != " " && board.cells[4] != " " && board.cells[8] == " ") ||   (board.cells[6] != " " && board.cells[7] != " " && board.cells[8] == " ")
          return avail_moves[8]
          
      elsif (board.cells[0] != " " && board.cells[2] != " " && board.cells[1] == " ") || (board.cells[4] != " " && board.cells[7] != " " && board.cells[1] == " ")
          return avail_moves[1]
          
      elsif (board.cells[0] != " " && board.cells[6] != " " && board.cells[3] == " ") || (board.cells[4] != " " && board.cells[5] != " " && board.cells[3] == " ")
          return avail_moves[3]
          
      elsif (board.cells[2] != " " && board.cells[8] != " " && board.cells[5] == " ") || (board.cells[3] != " " && board.cells[4] != " " && board.cells[5] == " ")
          return avail_moves[5]
          
      elsif (board.cells[6] != " " && board.cells[8] != " " && board.cells[7] == " ") || (board.cells[1] != " " && board.cells[4] != " " && board.cells[7] == " ")
          return avail_moves[7]
  else
    return avail_moves[comp_choice]
  end
   
  
  
  
    # #original
    # comp_choice = rand(8) 
     # #original
  #return avail_moves[comp_choice]
    
    
  end 
  
end 

end 
    