class Player

  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(input)
    puts "Please enter in a number between: 1 - 9"
    player_input = gets.strip
    player_input

  end

end
