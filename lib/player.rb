class Player                           #root class that will act as an inheritance point for actual player classes
  attr_reader :token                  #player token cannot be changed once assigned in initialize (reader only)

  def initialize(token)               #init accepts a token to assign upon instantiation
    @token = token
  end
end
