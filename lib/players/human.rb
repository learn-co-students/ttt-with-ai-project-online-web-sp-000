module Players
    class Human < Player
        # Ask user for input and return it
        def move(board)
            input = gets.strip.chomp
        end
    end
end