module Players
    class Computer < Player
        def move(board)
            if !board.taken?("5")
                "5"
            elsif !board.taken?(cell)
                ["1", "2", "3", "4", "6", "7", "8", "9"].sample
            end
        end
    end
end