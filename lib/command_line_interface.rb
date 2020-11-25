class CommandLineInterface
  attr_accessor :choice

  def initialize
    "Welcome to Tic Tac Toe!"

  end

  def run
    gets_choice
    new_game
    play_again
  end

  def gets_choice
    puts "Type 0 to watch computer vs computer."
    puts "Type 1 to play you vs a computer."
    puts "Type 2 to play against another user."
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
        run
    elsif @choice == "n" || @choice == "N"
        puts "Thanks for playing."
    else
        puts "Please enter y or n."
    end
  end
end
