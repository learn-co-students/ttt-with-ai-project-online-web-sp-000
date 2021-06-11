require 'pry'

module Players

    class Computer < Player
        attr_accessor :board
        
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
        CORNER_SPOTS = [0, 2, 6, 8]

        def move(board)
            @board = board
            case
            when move_to_win != nil
                input = move_to_win + 1
            when move_to_block != nil
                input = move_to_block + 1
            when center_square?
                input = 5.to_s
            else
                move_random
            end
            
        end

        def move_to_win
            array_to_win = WIN_COMBINATIONS.detect do |c|
                (board.cells[c[0]] == "O" && board.cells[c[1]] == "O" && board.cells[c[2]] == " ") || (board.cells[c[2]] == "O" && board.cells[c[1]] == "O" && board.cells[c[0]] == " ") || (board.cells[c[0]] == "O" && board.cells[c[2]] == "O" && board.cells[c[1]] == " ")
            end
            if array_to_win != nil
                square_to_win = array_to_win.find {|c| board.cells[c] == " "}
            end
        end

        def move_to_block
            array_to_block = WIN_COMBINATIONS.detect do |c|
                (board.cells[c[0]] == "X" && board.cells[c[1]] == "X" && board.cells[c[2]] == " ") || (board.cells[c[2]] == "X" && board.cells[c[1]] == "X" && board.cells[c[0]] == " ") || (board.cells[c[0]] == "X" && board.cells[c[2]] == "X" && board.cells[c[1]] == " ")
            end
            if array_to_block != nil
                square_to_win = array_to_block.find {|c| board.cells[c] == " "}
            end
        end

        def center_square?
            board.cells[4] == " "
        end

        def move_random
            input = rand(9)
            input += 1
            if input == board.taken?(input)
                move_random
            end
            input
        end
    end

end