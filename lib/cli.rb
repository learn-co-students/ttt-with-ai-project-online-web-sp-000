class BeginGame
  def initialize
    puts "How many players ('0', '1', or '2')?"
    input = gets.chomp
    if input == '0'
      game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'), Board.new)
      game.play
    elsif input == '1'
      game = Game.new(Players::Human.new('X'), Players::Computer.new('O'), Board.new)
      game.play
    elsif input == '2'
      game = Game.new(Players::Human.new('X'), Players::Human.new('O'), Board.new)
      game.play
    end
  end
end
