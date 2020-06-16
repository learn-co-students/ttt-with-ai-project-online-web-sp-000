class Game

    attr_accessor :board, :player_1, :player_2

    # All possible winning combinations, based on the index in the @cells array for each 'Board' object.
    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,3,6], # Left column
        [1,4,7], # Middle column
        [2,5,8], # Right column
        [0,4,8], # Left-to-right diagonal
        [2,4,6]  # Right-to-left diagonal
    ]

    # Defaults to two human players with an empty gameboard.
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    # Decides current player based off the assumption that the game always begins with "X".
    # An even number of turns means the next token will be "X"; and vice versa.
    def current_player
        x_count = self.board.cells.count {|token| token == "X"}
        o_count = self.board.cells.count {|token| token == "O"}
        if (x_count + o_count).even?
            player_1
        elsif (x_count + o_count).odd?
            player_2
        end
    end

    def won?
        # Iterates through WIN_COMBINATIONS and finds first matching win_combination and returns the winning array.
    WIN_COMBINATIONS.detect do |win_combination|
    
        # Each 'win_index' returns the first, second, and third elements of each winning combo array.
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        
        # Each 'position' uses the indices from the winning combos and applies them to the 'board' array.
        position_1 = self.board.cells[win_index_1]
        position_2 = self.board.cells[win_index_2]
        position_3 = self.board.cells[win_index_3]
        
        # Takes first win_combination and checks to see if they are all "X"'s or "O"'s and that the string is not empty.
        position_1 == position_2 && position_2 == position_3 && self.board.taken?(win_index_1 + 1)
        end
    end

    # Returns 'true' for a draw and 'false' for a won or in-progress game.
    # If the game isn't won and the board is full, then it is a draw (true).
    # If the game is won or isn't full, then not a draw (false).
    def draw?
        if self.won? == nil && self.board.full?
            true
        elsif self.won? != nil || !self.board.full?
            false
        end
    end

    # Returns 'true' for a finished game and 'false' for an in-progress game.
    # If the game is won or a draw, then it is over.
    # If the game is not full, not won, and isn't a draw, then it is not over.
    def over?
        if self.won? || self.draw?
            true
        elsif !self.board.full? && !self.won? && !self.draw?
            false
        end
    end

    # Returns the winning token.
    # If the game is won, it uses the first index of the winning combo to retrieve the token used in said winning combo.
    def winner
        if self.won?
            self.board.cells[self.won?[0]]
        elsif self.draw?
            nil
        end
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        self.valid_move?(input)
    end

end