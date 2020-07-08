module Players
    class Computer < Player

        def move(board)
            options = ["1","2","3","4","5","6","7","8","9"].select {|num| !board.taken?(num)}
            index = rand(options.length - 1)
            move = options[index]
        end

    end
end