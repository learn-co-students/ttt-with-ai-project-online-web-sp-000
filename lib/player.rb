# The Player root class will define only the most basic properties of a player,
# that they have a token property that can be set upon initialization.
class Player

  attr_reader :token

  # cannot be changed once assigned in initialize
  # accepts a token to assign
  def initialize(token)
    @token = token
  end

end
