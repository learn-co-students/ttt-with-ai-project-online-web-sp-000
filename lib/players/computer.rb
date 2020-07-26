module Players
    class Computer < Player 
        def move(board) 
            board.turn_count == 0 ? "5" : "1" || "3" || "2"
        end
    end
end