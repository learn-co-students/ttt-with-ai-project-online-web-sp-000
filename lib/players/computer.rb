module Players
    
    class Computer < Player
        VALIDMOVE = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        def move(board)
            VALIDMOVE.sample
        end
    end
end
