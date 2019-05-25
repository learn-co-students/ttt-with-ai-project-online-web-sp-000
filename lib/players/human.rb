require 'pry'
module Players 
  class Human < Player 
  
      def move(user_input)
        #binding.pry 
        puts "Put an input"
        user_input = gets.strip 
        @cells[user_input] = board.token 
        puts user_input 
      end
  
  
  end
  
  
end 