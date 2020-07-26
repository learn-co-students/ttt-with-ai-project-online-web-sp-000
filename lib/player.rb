class Player
  
  #this class defines only the basic essentials of what a player entails "The token property"
  attr_reader :token

  def initialize(token)
    @token = token
  end

end