# class GameController
#   attr_reader :game_type, :who_is_first
#
#   def initialize
#     puts "Welcome to Tic-tac-toe!"
#     choose_game_type
#     if game_type == "0"
#       game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
#     elsif game_type == "1"
#       if @who_is_first == "c"
#         game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
#       elsif @who_is_first == "h"
#         game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
#       end
#     elsif game_type == "2"
#       game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
#     end
#     game.play
#   end
#
#   def choose_game_type
#     puts "What mode do you want to play this game in:"
#     puts "   for Computer vs. Computer: type 0"
#     puts "   for Computer vs. Human: type 1"
#     puts "   for Human vs. Human: type 2"
#     @game_type = gets
#
#     if @game_type == "1"
#       puts "Who should go first?"
#       puts "   for computer, type c"
#       puts "   for human, type h"
#       @who_is_first = gets
#     end
#   end
#
#   def self.play_again?
#     puts "Would you like to play again?"
#     puts "   to play again, type yes"
#     puts "   to exit, type no"
#     input = gets
#     if input == "yes"
#       GameController.new
#     end
#   end
#
# end
