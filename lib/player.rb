require_relative './game.rb'

class Player
  attr_reader :token

  def initialize(symbol)
    @token = symbol
  end

  def self.assign_players
    puts "How many players do you have? - 0,1, or 2"
    puts "Enter '0' for a computer game, Enter '1' to play the computer, Enter '2' to play a friend, Enter 'exit' to leave!"
      input_0 = gets.strip
      if input_0 == '0'
          puts "Computer V Computer"
          #player1 & player 2 will be computer
          player_1 = Players::Computer.new("X")
          player_2 = Players::Computer.new("O")
          Game.new(player_1 , player_2).play

      elsif input_0 == '1'
          puts 'Human V Computer'
          #player1 = computer & player2 = user
          puts "The computer is Player 1 with token X"
          puts "You are Player 2 with token O."
          player_1 = Players::Computer.new("X")
          #player_2 = Players::Human.new("O")
          Game.new(player_1).play

      elsif input_0 == '2'
        puts 'Human V Human'
        #player1 = a user & player2 = another user
        puts "Who should go first and be X? Enter '1' or '2'"
          input_1 = gets.strip
          if input_1 == '1'
              puts "Player 1 will be 'X' & Player 2 will be 'O'."
              player_1 = Players::Human.new("X")
              player_2 = Players::Human.new("O")
              Game.new.play
          elsif input_1 == '2'
              puts "Player 2 will be 'X' & Player 1 will be 'O'."
              player_1 = Players::Human.new("O")
              player_2 = Players::Human.new("X")
              Game.new.play
          end
       elsif input_0 == 'exit'
         puts "I am exiting now!"
         #exit
      end
  end

end
