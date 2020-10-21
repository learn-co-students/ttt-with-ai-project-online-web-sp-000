module Players
    class Human < Player
        def move(board = nil)
            move = gets.chomp
            move
        end
    end
end
