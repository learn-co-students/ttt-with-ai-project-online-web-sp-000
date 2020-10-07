require 'pry'

class Game

    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end 

    def start
      puts "Would you like to play a game?"
      main_menu
    end 

    def main_menu
      puts "\nPress 0 for a Computer-driven game."
      puts "Press 1 to play against the Computer."
      puts "Press 2 to play a two-player game."
      puts "The only winning move is not to play. (type 'exit')"
      puts "\nWhat is your move?"

      input = gets.strip.downcase

      case input
      when "0"
        @player_1 = Players::Computer.new("X")
        @player_2 = Players::Computer.new("O")
        puts "You have chosen to watch the Computer play with itself. You dirty code-monkey you."
        play
      when "1"
        @player_2 = Players::Computer.new("O")
        puts "You have chosen to play with the Computer."
        play
      when "2"
        puts "You have chosen to play with another human."
        play
      when "exit"
      else
        puts "This is gibberish. I can't work with this."
        main_menu
      end 

    end 

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

    def current_player
        if @board.turn_count % 2 == 1
            @player_2
        elsif @board.turn_count % 2 == 0
            @player_1
        end 
    end 

    def won?
        won = false
        for win_con in WIN_COMBINATIONS do
            winv1 = win_con[0]
            winv2 = win_con[1]
            winv3 = win_con[2]
            #Assigns variables to each position index for a winning board set.
            #binding.pry 
            position_1 = @board.cells[winv1]
            position_2 = @board.cells[winv2]
            position_3 = @board.cells[winv3]
            #Places the position index on the board for...
        
            if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
              won = win_con
            end
            #...checking to see if X or O has a marker in each position for a winning set. 
            #If they do, variable won = the winning set
          end 
          won
    end 

    def draw? 
        if @board.full? == true && won? == false
            true
          else 
            false
          end 
    end 

    def over?
        if won? != false || draw? == true
            true
          end 
    end 

    def winner
            if won? != false
              #Obv, if there is a winning array...
              @board.cells[won?[0]]
              #Returns the string on the board in the first position of the winning array
              #i.e. won?[0] gives the coordinate on the board to look at, so you wrap it in @board[]
            end 
    end 

    def turn
        input = current_player.move(@board)
        #Input = whatever move the current player wants to make
        #Includes @board = position on the board and input = user input/position choice
        if @board.valid_move?(input) == false
          puts "That is not a valid move, please enter a correct number (1-9)"
          turn
          #Yes you can call methods within themselves when it's appropriate
          #GoTo Line 77
        else
        end 
        @board.update(input, current_player)
        #Updates the board 
        #Takes the arguments of input as above (input = current player etc)
        #Uses the current player rather than the player variable
        #To keep track of whose turn it is
        @board.display
        #Don't forget that these are instance methods
        #So you need the variable that holds the instance
    end 

    def play
      until over? == true
        turn
        play
      end
      if won? != false
        puts "Congratulations #{winner}!"
        #Remember: won? defaults to false OR RETURNS THE WINNING COMBINATION
        #There is no 'true' value
        #So you have to treat it as if won = false and THEN collect the winner
      else draw? == true
        puts "Cat's Game!"
        #And then obviously your other option is if draw == true
        #And we're leaving open a third option I guess
      end
    end 
end 
