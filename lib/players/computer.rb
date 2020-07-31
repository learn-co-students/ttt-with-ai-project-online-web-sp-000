module Players
  class Computer < Player 
    
    def move(board)
      input = rand(1..9).to_s
      
      until !board.taken?(input)
      input = rand(1..9).to_s
      end
      
      return input
    end
    
  end 
end 