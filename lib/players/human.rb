module Players
  
  class Human < Player
    
    def move(board_oi)                      
      move = gets.strip
      board_oi.update_move_box(move)
    end
    
  end
  
end