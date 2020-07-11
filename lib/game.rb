require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :x_win, :o_win, :tie
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      p_1 = combo[0]
      p_2 = combo[1]
      p_3 = combo[2]
      if @board.cells[p_1] == @board.cells[p_2] && @board.cells[p_1] == @board.cells[p_3] && @board.cells[p_1] != " "
        combo
      end
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    if !over? || draw?
      nil
    elsif won?
      @board.cells[won?[1]]
    end
  end

  def turn
    input = current_player.move(@board)
    if input.downcase == "exit"
      puts "Thank you for visiting, see you next time!"
      exit
    elsif @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      turn
    end
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    cli
  end

  def self.cli
    puts "There are three game modes to choose from:"
    puts "2 Player to play with a friend,"
    puts "Single player to test your skills,"
    puts "or you could have me play myself."
    puts "Please make a selection of 0, 1, or 2 players. You can also type 'exit' to quit:"
    choice = gets.chomp

    if choice == "exit"
      puts "Thank you for visiting, see you next time!"
    elsif choice == "0"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      game.play
    elsif choice == "1"
      puts "Would you like to be 'X' and go first? Y/N"
      player_choice = gets.chomp
      player_choice.upcase!
      if player_choice == "EXIT"
        puts "Thank you for visiting, see you next time!"
      else
        until player_choice == "Y" || player_choice == "N"
          puts "Please make your selection with just 'Y' or 'N'."
          player_choice = gets.chomp
        end
        if player_choice == "Y"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
        elsif player_choice == "N"
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
        end
        game.play
      end
    elsif choice.downcase == "wargames"
      wargames
    else
      game = Game.new
      game.play
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    end
    puts "Would you like to play again? Y/N"
    input = gets.chomp
    if input.downcase == "y"
      self.class.cli
    else
      puts "Thank you for playing, see you next time!"
    end
  end

  def self.wargames
    @x_win = 0
    @o_win = 0
    @tie = 0
    100.times do
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      until game.over?
        game.turn
      end
      if game.draw?
        @tie += 1
        puts "Cat's Game!"
      elsif game.winner == "X"
        @x_win += 1
        puts "Congratulations X!"
      elsif game.winner == "O"
        @o_win += 1
        puts "Congratulations O!"
      end
    end
    puts "Wargame results are as follows:"
    puts "Tied #{@tie} times"
    puts "X won #{@x_win} times"
    puts "O won #{@o_win} times"
    puts "Would you like to play again? Y/N"
    input = gets.chomp
    if input.downcase == "y"
      self.cli
    else
      puts "Thank you for playing, see you next time!"
    end
  end
end
