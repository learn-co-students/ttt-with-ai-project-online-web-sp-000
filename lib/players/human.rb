module Players
    class Human < Player

        def move(board)
            puts "What spot?"
            input = gets.strip
        end

    end
end