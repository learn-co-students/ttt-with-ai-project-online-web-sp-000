#!/usr/bin/env ruby

require_relative '../config/environment'

def start
  puts "Welcome to Tic Tac Toe!"
  puts "Please choose your game mode:
  
  0 - Computer v Computer
  1 - Player v Computer
  2 - Player v Player
  exit - to stop playing"
  
  game_mode = gets.chomp
  
  if game_mode == "0"
    Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    
  elsif game_mode == "1"
    Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play 
    
  elsif game_mode == "2"
    Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
  
  end
end

start until gets.chomp == "exit"
