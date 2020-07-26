class Play

  def initialize
  end

  def start
    puts "What kind of game do you want to play? 1, 2, or 0?"
    kind = gets.chomp
    if kind == "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
      puts "Would you like to play again?"
      loop
    elsif kind == "1"
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      puts "Would you like to play again?"
      loop
    elsif kind == "2"
      Game.new(Players::Human.new("X"), Players::Human.new("O")).play
      puts "Would you like to play again?"
      loop
    else
      puts "That entry is invalid. Plese select 1, 2, or 0 players."
      start
    end
  end

  def loop
    puts "Please enter y or n"
    answer = gets.strip
    if answer == "y"
      start
    elsif answer == "n"
      puts "Goodbye!"
      exit
    else
      loop
    end
  end
end
