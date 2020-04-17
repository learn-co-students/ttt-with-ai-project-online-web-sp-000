class Game

     WIN_COMBINATIONS = 
    [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    attr_accessor :board, :player_1, :player_2

    def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def self.start
        puts "Let's play Tic-Tac-Toe!"
        board = Board.new
        board.display

        puts "What kind of game do you want to play? 0, 1, or 2 player? [0/1/2]"
        user_input = gets

        case user_input.to_i
        when 0
            game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        when 1
            game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        when 2
            game = Game.new
        end

        game.play

        puts "Would you like to play again? [Y/N]"
    end

    def current_player
        @board.turn_count.even? ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.find do |combo|
            board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
        end
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if over?
            @board.cells[self.won?[0]]
        end
    end

    def turn
        user_input = current_player.move(@board)
        if @board.valid_move?(user_input)
          @board.update(user_input, current_player)
          @board.display
          puts "\n"
        elsif user_input.to_i.between?(1,9) == false
          turn
        end
    end

    def play
        turn until over?
        if won?
            puts "Congratulations #{self.winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end