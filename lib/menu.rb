class Menu
  def front_page
    Gem.win_platform? ? (system "cls") : (system "clear")
    puts "Welcome to Jacob's Tic Tac Toe Game"
    puts ""
    puts "Options:"
    puts "1. Watch an AI VS AI game"
    puts "2. Play against (Unbeatable) AI"
    puts "3. Play against a player"
    puts "4. Exit"
    choice(gets)
  end

  def choice(input)
    case input.strip.to_i
    when 1
      ai
    when 2
      one_player
    when 3
      two_player
    when 4
      return 0
    else
      puts "Error please try again"
      sleep(3)
      front_page
    end
  end

  def ai
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    game.board.cells[rand(0..8)] = "X"
    game.play

    puts "enter to continue"
    gets
    front_page
  end

  def one_player
    Gem.win_platform? ? (system "cls") : (system "clear")
    puts "Type 1 for going first and 2 for going second"
    input = gets.strip.to_i
    if input == 1
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play 
    elsif input == 2
      Game.new(Players::Computer.new("X"), Players::Human.new("O")).play 
    else
      puts "error parsing input"
    end
    
    puts "enter to continue"
    gets
    front_page
  end

  def two_player
    Gem.win_platform? ? (system "cls") : (system "clear")
    Game.new(Players::Human.new("X"), Players::Human.new("O")).play 

    puts "enter to continue"
    gets
    front_page
  end
end