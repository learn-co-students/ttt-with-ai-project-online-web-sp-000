module Players
  #Players::Computer inherits from Player
  class Computer < Player 
    attr_accessor :board
    
    def move(board)
      #valid moves can be 1..9 
      return rand(1..9).to_s
    end 
    
  end 
  
    
end 

  