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
        self.player_1 = player_1
        self.player_2 = player_2
        self.board = board
    end

    def current_player
        turn_count.even? ? player_1 : player_2
    end

    def opponent
        turn_count.even? ? player_2 : player_1
    end

    def turn_count
        board.cells.select{|cell| cell != " " }.count
    end

    def won?
        WIN_COMBINATIONS.find do |combo|
            combo.all?{|cell| board.cells[cell] == "X"} || combo.all?{|cell| board.cells[cell] == "O"}
        end
    end

    def draw?
        if board.full? && !won?
            true
        else
            false
        end
    end

    def over?
        draw? || won?
    end

    def winner
        if over? && !draw?
            index = won?.first
            board.cells[index]
        else
            nil
        end
    end

    def turn
        board.display
        input = current_player.move(board)
        if board.valid_move?(input)
            board.update(input, current_player)
        else
            puts "Sorry, that move is not valid."
            turn
        end
    end

    def play
        turn until over?
        if draw?
            board.display
            puts "Cat's Game!" 
        elsif won?
            board.display
            puts "Congratulations #{winner}!"
        end
    end

end