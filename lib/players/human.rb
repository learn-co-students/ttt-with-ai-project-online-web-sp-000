module Players
    class Human < Player
        
        def move(board)
            puts "Please enter something"
            gets.strip
        end

    end
end