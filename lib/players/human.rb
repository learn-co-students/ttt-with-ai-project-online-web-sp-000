#Players::Human inherits from Player
module Players
  
  class Human < Player
  
    def move (board)
      #move asks the user for input and returns it
      gets.strip
    end
    
  end
  
end