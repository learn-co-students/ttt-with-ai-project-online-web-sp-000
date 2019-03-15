require "pry"
class Player
  attr_reader :token

  @@all = []

  def initialize(token)
    @token = token
    @@all << self
  end

end
