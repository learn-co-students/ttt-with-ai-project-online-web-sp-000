require 'bundler'
Bundler.require

require_all 'lib'

puts "Please enter number of players 0, 1, or 2."
input = gets.chomp
until input == "0" || input == "1" || input == "2"
  puts "Please enter number of players 0-2."
  input = gets.chomp
end
the_game = nil
if input == "0"
  the_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
elsif input == "1"
  the_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
else
  the_game = Game.new
end

the_game.play
