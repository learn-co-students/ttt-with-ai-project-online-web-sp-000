require 'pry'

class Game

    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2],
    ]
    

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        if board.turn_count.odd?
            @player_2
        else
            @player_1
        end
    end

    def won?
        WIN_COMBINATIONS.detect {|wc| board.cells[wc[0]] == board.cells[wc[1]] && board.cells[wc[1]] == board.cells[wc[2]] && board.taken?(wc[0] + 1 )}
    end

    def draw?
        !won? && board.full?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            board.cells[won?[0]]
        else
            puts "No Winner!"
        end
    end

    def turn
        if current_player.class == Players::Human
            puts "Please enter 1-9:"
            input = current_player.move(board)
            if board.valid_move?(input)
                board.update(input, current_player)
                board.display
            else 
                turn
            end
        else
            puts "I'm thinking..."
            sleep 2
            input = current_player.move(board)
            if board.valid_move?(input)
                board.update(input, current_player)
                board.display
            else 
                turn
            end
        end
    end

    def play
        until over? do
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end

    def zero_players
        puts "Get comfortable and enjoy the show."
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
        #play with time delay?
        #thinking...
        #wargames
    end

    def one_player
        puts "Would you like to go first? Please enter 'X'."
        puts "Want me to go first? Please enter 'O'."
        input = gets.strip
        
        if input == "X" || input == "x"
            Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
        else
            Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
        end
    end

    def two_player
        puts "Who would like to go first? You would? Please enter 'X'."
        input = gets.strip
        play

        #show whose turn it is X vs. O
    end

    def start
        input = ""

        puts ""
        puts "Welcome to Tic-Tac-Toe *~*with AI*~*"
        puts ""
        puts "This is how the spaces on the board are numbered:"
        puts ""
        puts " 1 | 2 | 3 "
        puts "-----------"
        puts " 4 | 5 | 6 "
        puts "-----------"
        puts " 7 | 8 | 9 "
        puts ""

        while input != "N"
            puts "How many players are joining this round? 0, 1, or 2?"
            input = gets.strip

                case input
                    when "0"
                        zero_players
                    when "1"
                        one_player
                    when "2"
                        two_player
                    #ELSE raise customerror "Ruby Metaprogramming Custom Error"
                end
    

            puts "Would you like to play again? Y/N"
            input = gets.strip

        end
    end

end