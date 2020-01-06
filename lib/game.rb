## Objectives
# 1. Build a command-line interface (CLI).
# 2. Create a domain model with multiple relating and collaborating objects.

class Game
  # extend Players::Human
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
     [0, 1, 2],
     [3, 4, 5],
     [6, 7, 8],
     [0, 3, 6],
     [1, 4, 7],
     [2, 5, 8],
     [0, 4, 8],
     [6, 4, 2]
   ]

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),
                  board = Board.new)
     # defaults to two human players
     @board = board
     @player_1 = player_1
     @player_2 = player_2
   end

   def current_player
     # returns the correct player, X, for the third move
     @board.turn_count.even? ? player_1 : player_2
   end

   def won?
     WIN_COMBINATIONS.detect do |win_combo|
       if (@board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X") ||
         (@board.cells[win_combo[0]] == "O" && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O")
         win_combo
       else
         false
       end
     end
   end

   def draw?
     if !won? && @board.full?
       true
     else
       false
     end
   end

   def over?
     if draw? || won?
       true
     else
       false
     end
   end

   def winner
     if won?
       @board.cells[won?[0]]
     end
     # binding.pry
   end

   def turn
    #  makes valid moves
    #  asks for input again after a failed validation
    # changes to player_2 after the first turn
    player_move = current_player.move(board)
    if @board.valid_move?(player_move)
      #binding.pry
      board.update(player_move, current_player)
      @board.display
    else
      puts "Invalid input."
      turn
    end
   end

   def play
     # asks for players input on a turn of the game
     until over?
       turn
     end

     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cat's Game!"
     end
   end

   def start
     # greet with message
     # prompt the player for what type of game to play: 0, 1 or 2 player
     # ask the user for who should go first and be 'X'
     # use the input to correctly initialize the game with appropriate player
     # types and token values
     # when game is over prompt the user if they would like to play again
     # and allow them to choose configuration for the game as described above
     # if user no more play then exit the program
     game_menu
     user_input = gets.strip.downcase
     case user_input.to_s
     when '0'
       # 0 player
       computer_vs_computer
     when '1'
       # 1 player
       player_vs_computer
     when '2'
       # 2 player
       player_vs_player
     when 'exit'
       # exit the program
       puts "Goodbye, Thanks for playing!"
     else
       start
     end
   end

   def game_menu
     puts "Welcome to Tic Tac Toe W/ AI!"
     puts "What type of game will you choose: '0', '1', or '2' players."
     puts "Type 'exit' to end the game."
   end

   def computer_vs_computer
     computer_player1 = Players::Computer.new("X")
     computer_player2 = Players::Computer.new("O")
     Game.new(computer_player1, computer_player2, Board.new).play
   end

   def player_vs_computer
     puts "Who will go first and be 'X'? (Type 'y' for 1st, 'n' for 2nd)"
     if gets.strip.downcase == 'y'
       Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
     else
       Game.new(Players::Computer.new("O"), Players::Human.new("X"), Board.new).play
     end
   end

   def player_vs_player
     human_player1 = Players::Human.new("X")
     human_player2 = Players::Human.new("O")
     Game.new(human_player1, human_player2, Board.new).play
   end

end
