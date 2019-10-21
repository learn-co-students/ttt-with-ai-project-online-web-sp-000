class Player
  attr_accessor :token
  def initialize(token)
    @token = token
  end
  #not a valid player, but a root class that will act like inheritance point for actual player classes such as Human < Player and Computer < Player
  #defines most basic properties of a player: token that is set on initialization
  #all player subclasses implement #move method
end