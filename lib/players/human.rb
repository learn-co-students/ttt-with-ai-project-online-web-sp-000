module Players
    class Human < Player

        def move(board)
            board.display
            puts "Where would you like to go? 1-9"
            cell = gets.strip
        end

    end
end