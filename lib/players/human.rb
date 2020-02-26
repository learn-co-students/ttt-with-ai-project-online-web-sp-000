
module Players
    class Human < Player

        def move(board)
            board.display
            puts "Please choose a position by typing: 1-9"
            gets.strip
        end

    end
end
