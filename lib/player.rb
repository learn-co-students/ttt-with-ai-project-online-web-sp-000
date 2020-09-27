require 'pry'
class Player
  
  attr_reader :token 
  
  def initialize(token)
    @token = token   #token instance variable that's associated with our plpayer is equal to that token that we're passing in as an argument 
  end 
end 