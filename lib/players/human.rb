# defining "Players" module in order to call Players::Human
module Players
    class Human < Player
        # allows a human player to enter a move via CLI
        def move(board)
            input = gets.chomp
            input
        end
    end
end