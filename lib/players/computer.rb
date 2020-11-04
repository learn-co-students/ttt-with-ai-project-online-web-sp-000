module Players
    class Computer < Player
        def move(board = nil)
            rand(1..9).floor.to_s
        end
    end
end