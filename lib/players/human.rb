module Players
    class Human < Player
        def move(board)
            puts 'Please enter your desired space.'
            input = gets.strip
            input
        end
    end
end