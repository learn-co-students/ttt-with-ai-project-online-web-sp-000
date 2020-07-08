class Game
    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

    def current_player
        @board.turn_count.even? ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if @board.taken?(combo[0]+1) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
              return combo
            end
        end
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if combo = won?
            @board.cells[combo[0]]
        end
    end
    
    def turn
        player = current_player
        input = player.move(@board)
        if !@board.valid_move?(input)
            puts "Invalid. Try again"
            turn
        else
            @board.update(input, player)
            puts "Thanks #{player.token}. Current board:"
            @board.display
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end