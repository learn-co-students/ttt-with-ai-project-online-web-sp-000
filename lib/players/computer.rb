module Players
    class Computer < Player
        def move(board = nil)
            move = rand(1..9).floor.to_s
            move
        end
    end
end