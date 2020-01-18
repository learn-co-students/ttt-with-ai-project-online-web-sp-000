require_relative 'board.rb'
require_relative 'game.rb'
require_relative 'player.rb'
require_relative 'players/computer.rb'
require_relative 'players/human.rb'

game = Game.new
game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
p game.draw?
