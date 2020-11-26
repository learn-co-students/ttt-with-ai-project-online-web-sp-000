class CommandLineInterface
  attr_accessor :choice

  def intro
    puts "Welcome to Tic Tac Toe!"
  end

  def run
    gets_choice
    new_game
    play_again
    repeat_or_exit
  end

  def gets_choice
    puts "Type 0 to play computer vs computer."
    puts "Type 1 to play self vs computer."
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
  end

  def repeat_or_exit
    if @choice == "y" || @choice == "Y"
        run
    elsif @choice == "n" || @choice == "N"
        puts "Thanks for playing."
    else
        puts "Please enter y or n."
        @choice = gets.strip
        repeat_or_exit
    end
  end
end
