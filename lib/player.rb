class Player
  attr_reader :token #can't be changed. read only

  def initialize(token)
    @token = token
  end

end #end class
