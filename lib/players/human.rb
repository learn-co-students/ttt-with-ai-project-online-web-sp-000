
module Players
    class Human < Player
        def move(board)
            puts "Please choose a position by typing: 1-9"
            board.display
            gets.strip
        end
    end
end
