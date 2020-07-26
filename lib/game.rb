class Game

    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        board.turn_count.even? ? player_1 : player_2 
    end

    def won?
        WIN_COMBINATIONS.find do |combo|
            board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
        end
    end

    def draw?
        board.full? && !won?
    end

    def over?
        won? || draw?
    end
    
    def winner
        if combo = won?
            board.cells[combo[0]] 
        end   
    end

    def turn
        input = current_player.move(board).to_i 

        if board.valid_move?(input)
            board.update(input, current_player)
        elsif input.between?(1, 9) == false
            turn
        end
    end

    def play 
        turn until over?
        
        if winner
            puts "Congratulations #{winner}!"
        else 
            puts "Cat's Game!"
        end
    end

end