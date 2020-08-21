require 'pry'

class Game
    attr_accessor :board, :player_1, :player_2, :token

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8], # bottom row
        [0,3,6], # left column
        [1,4,7], # middle column
        [2,5,8], # right column
        [0,4,8], # diagonal
        [2,4,6] # diagonal
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            @board.cells[combo[0]] == @board.cells[combo[1]] &&
            @board.cells[combo[0]] == @board.cells[combo[2]] &&
            @board.cells[combo[0]] != " "
        end
    end

    def draw?
        board.full? && !won?
    end

    def over?
        if won? || draw? || board.full?
            true
        end
    end

    def winner
        if won? 
            @board.cells[won?[0]] if @board.cells[won?[0]] # != " "
        end
    end

    # turn makes valid moves
    # player 2 after the first turn
    def turn
        player = current_player
        move = player.move(board)
        if @board.valid_move?(move)
            @board.update(move, player)
        else
            puts "Invalid"
            turn
        end
    end

    def play
        #binding.pry
        until over?
            turn
        end
        
        if draw?
            puts "Cat's Game!"
        elsif won?
            puts "Congratulations #{winner}!"
        end
    end
end