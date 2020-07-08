module Players
    class Human < Player

        def move(board)
            puts "Please enter a position (1-9) #{display}"
            input = gets.strip
            input
        end

        def display
            puts " 1 | 2 | 3 "
            puts "-----------"
            puts " 4 | 5 | 6 "
            puts "-----------"
            puts " 7 | 8 | 9 "
        end

    end
end