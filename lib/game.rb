class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                        [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end
      
    def current_player
        turns = @board.cells.select {|i| i == "X" || i == "O"}
        turns.count % 2 == 0? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.each do |win_arrays|
            pos1 = win_arrays[0]
            pos2 = win_arrays[1]
            pos3 = win_arrays[2]
            if @board.cells[pos1] == "X" && @board.cells[pos2] == "X" && @board.cells[pos3] == "X" || @board.cells[pos1] == "O" && @board.cells[pos2] == "O" && @board.cells[pos3] == "O"
             return win_arrays
            end
        end
        false
    end

    def draw?
        if !board.cells.detect {|i| i == " "} && won? == false
            true
        else
            false
        end
    end

    def over?
        if won? || draw?
            true
        else
            false
        end
    end

    def winner
        if won?
            winner = won?[0]
            @board.cells[winner]
        end
    end

    def turn
        
    end
end