class MainMenu
  
  def initialize
    puts "Welcome to Tic Tac Toe"
    play_again = "y"
    while play_again == "y"
      playing
      puts "Do you want to play again? (Y/N)"
      play_again = gets.strip.downcase
      while play_again != "y" && play_again != "n"
        puts "Please enter Y for yes or N for no."
        play_again = gets.strip.downcase
      end
    end
  end
    
  def playing
    puts "How many humans are playing today?"
    humans = gets.strip
    while !humans.match(/^[0-2]$/) && humans != "wargames"
      puts "Please enter a valid number of humans. (0-2)"
      humans = gets.strip
    end
    if humans.downcase == "wargames"
      wargames
    else
      start_game(humans)
    end
  end
  
  def start_game(humans)
    humans = humans.to_i
    if humans == 0
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    elsif humans == 1
      human = choose_letter
      if human.downcase == "x"
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      else
        Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
      end
    elsif humans == 2
      Game.new(Players::Human.new("X"), Players::Human.new("O")).play
    end
  end
  
  def choose_letter
    puts "Pick your letter. (X or O)"
    letter = gets.strip
    while !letter.match(/^[XO]$/)
      puts "Please enter a valid letter. (X or O)"
      letter = gets.strip
    end
    letter
  end
  
  def wargames
    puts "Who will be randomized, X, O, or neither"
    random = gets.strip.downcase
    while random != "x" && random != "o" && random != "neither"
      puts "Please enter a valid parameter. (X/O/neither)"
      random = gets.strip.downcase
    end
    x_victories = 0
    o_victories = 0
    draws = 0
    if random == "x"
      100.times do
        game = Game.new(Players::Random.new("X"), Players::Computer.new("O"))
        game.play
        if game.winner == "X"
          x_victories += 1
        elsif game.winner == "O"
          o_victories += 1
        else
          draws += 1
        end
      end
    elsif random == "o"
      100.times do
        game = Game.new(Players::Computer.new("X"), Players::Random.new("O"))
        game.play
        if game.winner == "X"
          x_victories += 1
        elsif game.winner == "O"
          o_victories += 1
        else
          draws += 1
        end
      end
    else
      100.times do
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        game.play
        if game.winner == "X"
          x_victories += 1
        elsif game.winner == "O"
          o_victories += 1
        else
          draws += 1
        end
      end
    end
    puts "X won #{x_victories} times"
    puts "O won #{o_victories} times"
    puts "There were #{draws} draws"
  end
  
end