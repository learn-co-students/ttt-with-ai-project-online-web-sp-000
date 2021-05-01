class CLI
  
  attr_accessor :players
  
  def start
    puts "Welcome to Tic Tac Toe"
    tutorial
    print "Enter number of players (0, 1, or 2) or wargames: "
    player_input
  end
  
  def tutorial
    puts "The board is labelled as follows:", " "
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts " ", "You will enter a number 1-9 for the cell you want fill.", " "
  end
  
  def player_input
    self.players = gets.strip
    if players == "0" || players == "1" || players == "2" || players == "wargames"
      game
    else
      puts "Invalid input.",""
      start
    end
  end
  
  def game
    if players == "0"
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")
      tic_tac_toe = Game.new(player_1, player_2)
      tic_tac_toe.play  
    end
    
    if players == "1"
     puts "The board is currently empty"
     print "Would you like to go first(y/n)? "
     x = gets.strip
     if x == "y"
       puts "You are X. Select a cell number to fill"
       human = Players::Human.new("X")
       computer = Players::Computer.new("O")
       tic_tac_toe = Game.new(human, computer)
       tic_tac_toe.play
      else
        human = Players::Human.new("O")
        computer = Players::Computer.new("X")
        tic_tac_toe = Game.new(computer, human)
        tic_tac_toe.play
      end
    end
    
    if players == "2"
      tic_tac_toe = Game.new
      tic_tac_toe.play
    end
    
    if players == "wargames"
      i = 0
      wins = 0 
      draws = 0
      while i < 100
        player_1 = Players::Computer.new("X")
        player_2 = Players::Computer.new("O")
        tic_tac_toe = Game.new(player_1, player_2)
        tic_tac_toe.play
        if tic_tac_toe.won?
          wins += 1
        else 
          draws += 1
        end  
        i += 1
      end
      puts "#{wins} wins"
      puts "#{draws} draws"
    end
    
    play_again
  end
  
  def play_again
    print "Would you like to play again(y/n)? "
    play = gets.strip
    if play == "y"
      start
    else
      puts "Goodbye"
    end
  end
  
end