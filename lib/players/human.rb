require "pry"
module Players
  class Human < Player
    
    def move(input)
      user_input = gets.strip
    end  
    
  end
end
