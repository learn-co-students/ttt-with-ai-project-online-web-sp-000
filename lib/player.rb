class Player
attr_reader :token
  #initialize accepts a token to assign
  def initialize(token)
    @token = token
  end

  # token cannot be changed once assigned in initialize
  # def token
  #   @token
  # end
  
end 