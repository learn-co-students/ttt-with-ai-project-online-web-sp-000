require_relative './game.rb'

class Player
  attr_reader :token

  def initialize(symbol)
    @token = symbol
  end

  def self.assign_players
    puts "How many players do you have? - 0,1, or 2"
    puts "Enter '0' for a computer game, Enter '1' to play the computer, Enter '2' to play a friend, Enter 'exit' to leave!"
      input_0 = gets.to_str

      if input_0 == '0'
          #player1 & player 2 will be computer
          player_1 = Players::Computer.new("X")
          player_1.token = 'X'
          player_2 = Players::Computer.new("O")
          player_2.token = 'O'
          game = Game.new(player1, player2)
          game.play

      elsif input_0 == '1'
        #player1 = computer & player2 = user
        puts "You are Player 2, with token O."
        player_1 = Players::Computer.new("X")
        player_2 = Players::Human.new("O")
        player_1.token = 'X'
        player_2.token = 'O'
        game = Game.new(player1)
        game.play

      elsif input_0 == '2'
        #player1 = a user & player2 = another user
        puts "Who should go first and be X? Enter '1' or '2'"
          input_1 = gets.strip
          if input_1 == '1'
              puts "Player 1 will be 'X' & Player 2 will be 'O'."
              player_1 = Players::Human.new("X")
              player_2 = Players::Human.new("O")
          elsif input_1 == '2'
              puts "Player 2 will be 'X' & Player 1 will be 'O'."
              player_1 = Players::Human.new("O")
              player_2 = Players::Human.new("X")
              game = Game.new(player_1,player_2)
              game.play
          end
       elsif input_0 == 'exit'
         exit
      end
  end

end
