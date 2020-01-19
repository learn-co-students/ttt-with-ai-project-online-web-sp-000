require_relative 'board.rb'
require_relative 'game.rb'
require_relative 'player.rb'
require_relative 'players/computer.rb'
require_relative 'players/human.rb'

# h = Players::Human.new("O")
# c = Players::Computer.new("X")
# b = Board.new
# b.cells = [ " ", " ", " ", 
#             " ", " ", " ", 
#             " ", " ", " "]
# game = Game.new(h, c, b)
# game.play

c1 = Players::Computer.new("O")
c = Players::Computer.new("X")
b = Board.new
b.cells = [ " ", " ", " ", 
            " ", " ", " ", 
            " ", " ", " "]
game = Game.new(c, c1, b)
game.play