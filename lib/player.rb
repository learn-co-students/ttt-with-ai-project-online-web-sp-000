class Player
  attr_reader :token

  def initialize(player)
    @token = player.freeze
  end
end