module Players
    class Computer
        def move(board)
            # returns the move the computer wants to make in the form of a 1-9 string
            (Random.new.rand(9) + 1).to_s
        end
    end
end