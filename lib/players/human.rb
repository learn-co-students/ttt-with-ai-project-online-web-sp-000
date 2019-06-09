require "pry"
module Players
  class Human < Player
    
    def move(input)
      user_input = gets.strip
      
  #    input.cells[user_input.to_i - 1] = @token -> "X"
    end  
    
  end
end
