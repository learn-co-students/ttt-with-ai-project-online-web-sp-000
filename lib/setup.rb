class CommandLineInterface
  attr_accessor :choice

  def run
    puts "Welcome to Tic Tac Toe!"
    intro
    new_game
    play_again
  end

  def intro
    puts "Type 0 for computer vs computer"
    puts "Type 1 for user vs computer"
    puts "Type 2 for user vs user"
    @choice = gets.strip
  end

  def new_game
    case @choice
    when "0"
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        game.play
    when "1"
        game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
        game.play
    when "2"
        game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
        game.play
    else
        puts "please enter a valid choice"
        intro
    end
  end

  def play_again
    puts "Play again? (y/n)"
    @choice = gets.strip
    if @choice == "y" || @choice == "Y"
        intro
    elsif @choice == "n" || @choice == "N"
        puts "Thanks for playing."
    else
        puts "Please enter y or n."
    end
  end
end
