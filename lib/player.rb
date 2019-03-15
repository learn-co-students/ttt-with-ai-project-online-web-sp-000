require "pry"
class Player
  attr_reader :token

  @@all = []

  def mode
    puts "What mode would you like to play?"
    puts "For 0 player, type '0'"
    puts "For 1 player, type '1'"
    puts "For 2 player, type '2'"
    mode = gets.input
    case mode
      when "0"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      when "1"
        Game.new(Players::Computer.new("X"), Players::Human.new("O"))
      when "2"
        Game.new(Players::Human.new("X"), Players::Human.new("O"))
    end
  end

  def initialize(token)
    @token = token
    @@all << self
  end

end
