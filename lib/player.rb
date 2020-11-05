class Player

  attr_accessor :token

  def initialize(token)
    @token = token
    #cannot be changed
    #if self.token != token
    #  raise NoMethodError
    #end
  end


end
