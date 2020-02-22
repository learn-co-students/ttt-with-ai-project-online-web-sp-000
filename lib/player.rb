require_relative './game.rb'

class Player
  attr_reader :token

  def initialize(symbol)
    @token = symbol
  end

  def self.assign_players
    input = gets.to_i
    if input == 1
      player_1.token = 'X'
    else
      player_2.token = 'Y'
    end

  end

end
