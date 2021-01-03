require 'pry'

class Player
   attr_reader :token

  def initialize(player_token)
    @token = player_token
  end

  def self.token
    @token
  end
end
