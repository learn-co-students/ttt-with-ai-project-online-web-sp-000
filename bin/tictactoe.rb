#!/usr/bin/env ruby

require_relative '../config/environment'
  def welcome
    puts "*~*~*~*~*~*~*~*~*~*~*~*"
    puts "Welcome to Tic-Tac-Toe!"
    puts "*~*~*~*~*~*~*~*~*~*~*~*"
    sleep(2)
    system("clear")
    puts "How many human players (0-2)"
    input = gets.chomp
    if input.to_i.between?(0, 2)
      return input
    else
      system("clear")
      puts "*~*~*~*~*~*~*~*~*"
      puts "Invalid selection"
      puts "*~*~*~*~*~*~*~*~*"
      sleep(2)
      system("clear")
      welcome
    end
  end
  
  num_players = welcome
  
  if num_players.to_i == 1
    puts "Who should go first? (type 'human' or 'computer')"
    first = gets.chomp
    
    case first
      when 'human'
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O")
        game = Game.new(player_1, player_2)
        game.play
      when 'computer'
        player_1 = Players::Computer.new("X")
        player_2 =Players::Human.new("O")
        game = Game.new(player_1, player_2)
        game.play
      end
    end
  
  if num_players.to_i == 2
    player_1 = Players::Human.new("X")
    player_2 =Players::Human.new("O")
    game = Game.new(player_1, player_2)
    game.play
  end
  
  if num_players.to_i == 0
    player_1 = Players::Computer.new("X")
    player_2 = Players::Computer.new("O")
    game = Game.new(player_1, player_2)
    game.play
  end
      