require "pry"
module Players
  class Computer < Player
    
    def move(input)
      user_input = gets.strip
    end  
    
  end
end
