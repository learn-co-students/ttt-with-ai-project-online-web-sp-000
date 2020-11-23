module Players
  class Human < Player
    
    def move(board)
      gets.strip
    end
  end
  
  class Computer < Player
    
    def move(board)
      [5, 1, 3, 7, 9, 2, 4, 6, 8].detect {|n| board.cells[n-1] == ' '}.to_s
    end
    
  end
end

  