#a root class that will act as an inheritance point for actual player classes.
class Player
  attr_reader :token

  def initialize(token) #accepts a token to assign.
    @token = token #token cannot be changed once assigned to initialize.
  end

end
