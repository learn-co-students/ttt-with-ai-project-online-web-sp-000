#!/usr/bin/env ruby

require_relative '../config/environment'

  puts "Welcome to CLI Tic-Tac-Toe"
  puts "What kind of game do you want to play?"
  puts "Enter: 1 for single player vs computer, 2 for 2 player, and 3 for 2 computers"
  game_type = gets.strip
  #needs to create fix for edge cases
  if game_type == "1"
      puts "Would you like to play first [Y/N]"
      first = gets.strip
      #needs to create fix for edge cases
      if first == "Y"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
      elsif first == "N"
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
    end
  end


