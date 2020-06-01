class Game
    attr_accessor :board, :player_1, :player_2, :winner, :user_input

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6] ]

    def self.WIN_COMBINATIONS
        WIN_COMBINATIONS
    end
  
    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
        modulo_count = self.board.turn_count % 2

        if (modulo_count == 0)
            @player_1
        else
            @player_2
        end
    end

    def won?
        show_win_combo = false
        WIN_COMBINATIONS.each do |combo| 
            if (self.board.cells[combo[0]] == "X" && self.board.cells[combo[1]] == "X" && self.board.cells[combo[2]] == "X" || self.board.cells[combo[0]] == "O" && self.board.cells[combo[1]] == "O" && self.board.cells[combo[2]] == "O")
              show_win_combo = combo
            end
        end
        show_win_combo    
    end

    def draw?
        if (self.won? == false && self.board.full? == true)
            true
        else
            false
        end
    end

    def over?
        if (self.draw? == true || self.won? != false)
            true
        else
            false    
        end
    end

    def winner
        if (self.board.cells[self.won?[0]] == "X")
            "X"
         else
            "O"
        end
    end

    def turn
        move = self.current_player.move(self.board)
        
        if (self.board.valid_move?(move) == false)
            puts "That is not a valid move."
            if (self.current_player == Players::Human)
                puts "That is not a proper move."
                self.turn
            else
                self.turn
            end
            
        elsif
            self.board.update(move, self.current_player)
        end
    end

    def play
        until (self.over? == true) do
            self.turn
            self.board.display 
        end
        
        if (self.won? != true && self.draw? == false)
            puts "Congratulations #{self.winner}!"
        elsif (self.draw? == true)
            puts "Cat's Game!"
        end
    end

    def self.start
        start_game_choice = self.game_choice

        if (start_game_choice == 0)
            new_game = Game.new(player_1=Players::Computer.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
            new_game.play
        elsif (start_game_choice == 1)
            start_player_choice = self.player_choice
            start_x_choice = self.x_choice
            if (start_player_choice == 1 && start_x_choice == 1)
                new_game = Game.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
                new_game.play
            elsif (start_player_choice == 1 && start_x_choice == 2)
                new_game = Game.new(player_1=Players::Human.new("O"), player_2=Players::Computer.new("X"), board=Board.new)
                new_game.play
            elsif (start_player_choice == 2 && start_x_choice == 1)
                new_game = Game.new(player_1=Players::Computer.new("X"), player_2=Players::Human.new("O"), board=Board.new)
                new_game.play
            elsif (start_player_choice == 2 && start_x_choice == 2)
                new_game = Game.new(player_1=Players::Computer.new("O"), player_2=Players::Human.new("X"), board=Board.new)
                new_game.play
            end
        elsif (start_game_choice == 2)
            puts "Player 1 will go first."
            start_x_choice = self.x_choice
            if (start_x_choice == 1)
                new_game = Game.new(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
                new_game.play
            elsif (start_x_choice == 2)
                new_game = Game.new(player_1=Players::Human.new("O"), player_2=Players::Human.new("X"), board=Board.new)
                new_game.play
            end    
        else
            puts "Something happened. Please try again."
            self.start
        end
    end
    
    def self.game_choice
        puts "What type of game would you like to play?"
        puts "Enter 0 for a computer simulated game, enter 1 for a human player against a computer, or enter 2 to have a human player play against another human player."
        game_choice_input = gets.to_i
        if (game_choice_input == 0 || game_choice_input == 1 || game_choice_input == 2)
            game_choice_input
        else
            puts "Not a proper input. Please enter again."
            self.game_choice
        end
    end

    def self.player_choice
        puts "Who goes first?"
        puts "Enter 1 if you want to go first, or enter 2 if you want to go second."
        player_choice_input = gets.to_i
        if (player_choice_input == 1 || player_choice_input == 2)
            player_choice_input
        else
            puts "Not a proper input. Please enter again."
            self.player_choice
        end
    end

    def self.x_choice
        puts "Who should be X? Player 1 or player 2?"
        puts "Enter 1 if you want player 1 to be X, or enter 2 if you want player 2 to be X."
        x_choice_input = gets.to_i
        if (x_choice_input == 1 || x_choice_input == 2)
            x_choice_input
        else
            puts "Not a proper input. Please enter again."
            self.x_choice
        end
    end
    
end