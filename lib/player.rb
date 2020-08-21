class Player

  attr_accessor :game, :name
  attr_reader :token

  def initialize(token="X")
    @token = token
  end

end
