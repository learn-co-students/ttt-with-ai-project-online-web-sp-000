module Players
    class Computer < Player
        
        def move(board)

            def make_first_move
                first_move = ["1", "3", "5", "7", "9"].sample
            end
            
            if board.cells == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
                make_first_move
            else
                moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
            end
        end
    end
end