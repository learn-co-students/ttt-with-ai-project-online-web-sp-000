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

    # Applies current player's token to the desired board space.
    # Leveraging #move within the Human class, input is received. The desired space is then checked for validity.
    # If the move is valid, then the board is updated to reflected the new move and then the updated board is displayed.
    # If the move is invalid, the method starts again, by asking for user input.
    def turn
        current_move = current_player.move(@board)
        current_token = current_player.token
        if self.board.valid_move?(current_move)
            self.board.update(current_move, current_player)
            self.board.display
        else
            turn
        end
    end

    # Allows for a full playthrough of the game.
    # Until the game is over, #turn will be called.
    # Once the game is over, it verifies whether the game is over due to a win or a draw and outputs the approriate string.
    def play
        until self.over? do
            turn
        end

        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end

    def start
        #Greets user with a message.
        puts "Welcome to CLI Tic Tac Toe! Thanks for playing!"

        # Prompt the user for what kind of game they want to play, 0,1, or 2 player.
        puts "What kind of game would you like to play?"
        puts "Enter: '0' for computer vs. computer, '1' for human vs. computer, and '2' for human vs. human."
        input = gets.strip

        # Ask the user for who should go first and be "X".
        puts "Who should go first and be 'X'?"
        puts "Enter: 'player 1' or 'player 2'"
        token_input = gets.strip

        # Use the input to correctly initialize a Game with the appropriate player types and token values.
        case input
        when "0"
            if token_input == "player 1" || token_input == "Player 1"
                Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
            elsif token_input == "player 2" || token_input == "Player 2"
                Game.new(Players::Computer.new("O"), Players::Computer.new("X"))
            end
        when "1"
            if token_input == "player 1" || token_input == "Player 1"
                Game.new(Players::Human.new("X"), Players::Computer.new("O"))
            elsif token_input == "player 2" || token_input == "Player 2"
                Game.new(Players::Human.new("O"), Players::Computer.new("X"))
            end
        when "2"
            if token_input == "player 1" || token_input == "Player 1"
                Game.new
            elsif token_input == "player 2" || token_input == "Player 2"
                Game.new(Players::Human.new("O"), Players::Human.new("X"))
            end
        end

        # When the game is over, the CLI should prompt the user if they would like to play again
        # and allow them to choose a new configuration for the game as described above.
        if self.over?
            puts "Would you like to play again?"
            puts "Enter: 'yes' or 'no'."
            over_input = gets.strip
            if over_input == "yes" || over_input == "Yes"
                start
            elsif over_input == "no" || over_input == "No"
                
            end
        end
        # If the user doesn't want to play again, exit the program.
    end

end