module Players 
  class Computer < Player 
    def move(board)
      if !board.taken?("5")
        "5"
      else 
        computer_move(board)
      end 
    end 
    
    def computer_move(board)
      corner(board) || side(board) 
    end 
    
    def corner(board)
      if board.taken?("5")
        "1"
      elsif board.taken?("5") && board.taken?("1")
        "9"
      elsif board.taken?("5") && board.taken?("1") && board.taken?("9")
        "3"
      elsif board.taken?("5") && board.taken?("1") && board.taken?("9") && board.taken?("3")
        "7"
      else 
        computer_move(board)
      end 
    end 
    
    def side(board)
      if board.position("1") == board.position("3")
        "2"
      elsif board.position("1") == board.position("7")
        "4"
      elsif board.position("3") == board.position("9")
        "6"
      elsif board.position("7") == board.position("9")
        "8"
      else 
        computer_move(board)
      end 
    end 
    
    #def block(board)
    #end 
    
    #def win(board)
    #end 
  end 
end 