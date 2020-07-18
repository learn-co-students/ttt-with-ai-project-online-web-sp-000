module Players

    class Computer < Player


        def move(board)
            random_move = ["1","2","3","4","5","6","7","8","9"].sample
            board.valid_move?(random_move) ? random_move : move(board)
        end

    end

end