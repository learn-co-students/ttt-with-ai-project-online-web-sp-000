require 'pry'
class Game
    attr_accessor :board, :player_1, :player_2
    #   ::WIN_COMBINATIONS
    #     defines a constant WIN_COMBINATIONS with arrays for each win combination (FAILED - 1)

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end
    
    def current_player
        #     returns the correct player, X, for the third move (FAILED - 7)
        board.turn_count % 2 == 0 ? player_1 : player_2
    end
    
    def won?
        #     returns false for a draw (FAILED - 8)
        #     returns the correct winning combination in the case of a win (FAILED - 9)
        #     isn't hard-coded (FAILED - 10)
        WIN_COMBINATIONS.each do |combo|
            pos_1 = board.cells[combo[0]]
            pos_2 = board.cells[combo[1]]
            pos_3 = board.cells[combo[2]]
            
            return combo if (pos_1 == pos_2) && (pos_1 == pos_3) && (pos_1 != " ")
        end
        false
    end

    def draw?
#     returns true for a draw (FAILED - 11)
#     returns false for a won game (FAILED - 12)
#     returns false for an in-progress game (FAILED - 13)
        board.cells.none?(" ") && !self.won?
    end

    def over?
#     returns true for a draw (FAILED - 14)
#     returns true for a won game (FAILED - 15)
#     returns false for an in-progress game (FAILED - 16)
        self.draw? || self.won?
    end

    def winner
#     returns X when X won (FAILED - 17)
#     returns O when O won (FAILED - 18)
#     returns nil when no winner (FAILED - 19)
        self.won? ? board.cells[self.won?[0]] : nil
    end

    def turn
        player = current_player
        board.display
        puts "Where would you like to move?"
        puts "Select a cell 1-9"
        input = player.move(board)
        puts "#{current_player.token} selected... #{input}"
        #     makes valid moves (FAILED - 20)
        board.valid_move?(input) ? board.update(input, player) : self.turn
        #     asks for input again after a failed validation (FAILED - 21)
        #     changes to player 2 after the first turn (FAILED - 22)
    end

    def play
#     asks for players input on a turn of the game (FAILED - 23)
        turn until self.won? || self.over?
        if won?
            puts "Congratulations #{self.winner}!"
            board.display
        else
            puts "Cat's Game!"
            board.display
        end

#     checks if the game is over after every turn (FAILED - 24)
#     plays the first turn of the game (FAILED - 25)
#     plays the first few turns of the game (FAILED - 26)
#     checks if the game is won after every turn (FAILED - 27)
#     checks if the game is a draw after every turn (FAILED - 28)
#     stops playing if someone has won (FAILED - 29)
#     congratulates the winner X (FAILED - 30)
#     congratulates the winner O (FAILED - 31)
#     stops playing in a draw (FAILED - 32)
#     prints "Cat's Game!" on a draw (FAILED - 33)
#     plays through an entire game (FAILED - 34)
    end
end