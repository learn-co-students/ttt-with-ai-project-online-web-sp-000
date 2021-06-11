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
        [2,4,6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |c|
            board.cells[c[0]] == board.cells[c[1]] && board.cells[c[1]] == board.cells[c[2]] && board.cells[c[0]] != " "
        end
    end

    def draw?
        board.full? && !won?
    end

    def over?
        won? || draw? || board.full?
    end

    def winner
        won? ? board.cells[won?[0]] : nil
    end

    def turn
        input = current_player.move(board)
        if board.valid_move?(input)
            board.update(input, current_player)
            board.display
            puts " "
        else
            turn
        end
    end

    def play
        board.display
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end