module Players

    class Human < Player

        def move(board)
            puts "Please enter position between 1-9:"
            gets.strip
        end
    
    end

end