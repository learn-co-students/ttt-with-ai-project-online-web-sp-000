module Players
  
  class Computer < Player
    attr_accessor :board
    
    def move(board)
      turn_counter = board.turn_count
      
      if turn_counter == 0
        return "5"
      end
      
      if turn_counter == 1
        corners = ["1", "3", "7", "9"]
        corners.sample
      end
      
      automove
    end
    
    def automove
      board.cells.each_with_index do |cell, index|
        return ((index + 1).to_s) if cell == ' '
      end
    end
    
  end
  
end