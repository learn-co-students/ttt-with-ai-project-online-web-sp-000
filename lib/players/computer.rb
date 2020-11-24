module Players
    class Computer < Player
        def move(board)
            # returns the move the computer wants to make in the form of a 1-9 string
            (Random.new.rand(9) + 1).to_s
        end
    end

    class SmartComputer
        def move(board)
            # 9! (9 factorial) = 362,880 / 4
            # / 2 ...
        end
    end
end