# learn spec/02_player_spec.rb
require 'pry'

class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
end
