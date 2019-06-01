module Players 
  class Computer < Player 
  
    def move(board)
      if board.cells.taken?
        puts board.cells  
      end 
    end 
  end
end 