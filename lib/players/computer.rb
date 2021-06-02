module Players
    class Computer < Player
        def move(board)
            first_move = board.cells[4]
            next_move = board.cells[8, 6, 2, 0]
            last_moves = board.cells[7, 5, 3, 1]
            
            if first_move != "X" || first_move != "O"
                first_move
            elsif first_move == "X" || first_move == "O"
                next_best_move
            else
                last_moves
            end
        end
    end 
end 