class Player 
  
  attr_reader :token 
  
  def initialize(token) 
    @token = token 
  end 
  
  def move(user_input)
        #binding.pry 
    puts "Put an input"
    user_input = gets.strip 
        
    puts user_input 
        #@cells[user_input] = Player.token
  end
  
  
  
  
end 