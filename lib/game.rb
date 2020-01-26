# require_relative 'bin/tictactoe.rb'

class Game

  attr_accessor :board, :player_1, :player_2

  # class constant for winning combinations
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  # accepts 2 players and a board
  # defaults to two human players, X and O, with an empty board
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @board.display
  end

  # returns the correct player, X, for the third move
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  # returns false for a draw
  # returns the correct winning combination in the case of a win
  def won?
    WIN_COMBINATIONS.find do |winning|
        board.cells[winning[0]] == board.cells[winning[1]] && board.cells[winning[1]] == board.cells[winning[2]] && board.cells[winning[0]] != " "
    end
  end

  # returns true for a draw
  # returns false for a won game and false for an in-progress game
  def draw?
    board.full? && !won? ? true : false
  end

  # returns true for a draw
  # returns true for a won game
  # returns false for an in-progress game
  def over?
    self.won? || self.draw?
  end

  # returns X when X won; returns O when O won; returns nil when no winner
  # won? returns [0, 4, 8]
  def winner
    if won?
      return board.cells[won?[0]]
    end
  end

  # makes a valid move
  # asks for input again after a failed validation
  # changes to player 2 after the first turn
  def turn
    selection = self.current_player.move(board)
    if @board.valid_move?(selection)
      @board.update(selection, current_player)
    else
      puts "Invalid move. Try again."
      self.turn
    end
  end

  # asks for players input on a turn of the game
  # checks if the game is over after every turn
  # checks if the game is won after every turn
  # checks if the game is a draw after every turn
  # stops playing if someone has won
  # plays the first turn of the game
  # plays the first few turns of the game
  # congratulates the winner X; congratulates the winner O
  # stops playing in a draw; prints "Cat\'s Game!" on a draw
  # plays through an entire game

  def play
    # after every turn, check this... since #over checks won and draw i can exclude them
    until over? do
      self.turn
      @board.display
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    else self.draw?
      puts "Cat's Game!"
    end
  end

  # game between 2 computers
  def ai_game
    @player_1 = Computer.new("X")
    @player_1.board = self.board
    @player_2 = Computer.new("O")
    @player_2.board = self.board
    self.play
    self.play_again?
  end

  # game between human and computer
  def human_v_computer
    puts "Would you like to go first? (Y/N)"
      input = gets.chomp
      if input == "Y" || input == "y"
        # @player_1 = Human.new("X")
        @player_2 = Computer.new("O")
        @player_2.board = self.board
      elsif input == "N" || input == "n"
        @player_1 = Computer.new("X")
        @player_1.board = self.board
      else
        puts "Not a valid entry."
        self.play
      end
  end

  # game between 2 humans
  def human_v_human
    puts "Great, glad you have a friend!"
    puts "Select a number between 1-9"
    self.play
  end

  # When the game is over, the CLI should prompt the user if they would like to
  # play again and allow them to choose a new configuration for the game as described above.
  # If the user doesn't want to play again, exit the program.
  def play_again?
    answer = gets.chomp
    if over?
      puts "Play again? (Y/N)"
      if answer == Y || answer == "y"
        Board.reset!
        self.begin_game
      else
        puts "Ok, see you later!"
      end
    end
  end

  # Greet the user with a message.
  # Prompt the user for what kind of game they want to play, 0,1, or 2 player.
  # Ask the user for who should go first and be "X".
  # Use the input to correctly initialize a Game with the appropriate player types and token values.

  def begin_game
    puts "Hello there, welcome to Tic-tac-toe"
    puts "Would you like to play with 0, 1, or 2 players?"
    input = gets.chomp
    input
      if input == "0"
        self.ai_game
      elsif input == "1"
        self.human_v_computer
      else input == "2"
        self.human_v_human
      end
  end


# class end
end
