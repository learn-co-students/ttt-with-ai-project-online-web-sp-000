class Cli

  def play_game
    loop do
      puts "Welcome to TicTacToe.  Enter '0' for a simulated game, '1' for a one-player game, and '2' for a two-player game. Enter 'exit' to exit."
      input = gets.chomp
        if input == "0"
          game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
          game.play
        elsif input == "1"
          puts "Enter 'first' to be X, or 'second' to be O."
          input2 = gets.chomp
            if input2 == "first" || input2.downcase! == "first"
              game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
              game.play
            end
            if input2 == "second" || input2.downcase! == "second"
              game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
              game.play
            end
        elsif input == "2"
          game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
          game.play
        elsif input == 'exit' || input.downcase! == 'exit'
          break
        end
      end  

  end   #End play_game

end   #End class
