#!/usr/bin/env ruby

require_relative '../config/environment'
again = ""
while again != "N" do
   puts "\nWelcome to Command Line Tic Tac Toe!"
  puts "\nWhat kind of game will you like to play? Please choose player mode:
  1 - You VS Computer
  2 - You VS Your friend
  3 - Computer VS Computer"
  game_type = gets.strip
  #needs to create fix for edge cases (other than 123)
  if game_type == "1"
      puts "Would you like to play first [Y/N]"
      first = gets.strip.upcase
      #needs to create fix for edge cases (other than YN+yn)
      if first == "Y"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
      elsif first == "N"
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
      end
  elsif game_type == "2"
    puts "Whoever wants to play first will be X"
    Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
  elsif game_type == "3"
    puts "You will now watch two computers battle it out"
    Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
  end
puts "Would like to play again? [Y/N]"
  again = gets.strip.upcase
end

  

