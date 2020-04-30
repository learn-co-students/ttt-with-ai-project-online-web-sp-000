module Players
    class Computer < Player

        def move(board)
            if !board.taken?(1)  
                move = "1" 
            elsif !board.taken?(3)
                move = "3"
            elsif !board.taken?(7)
                move = "7"
            elsif !board.taken?(9)
                move = "9"
            end
            move
        end

    end
end

