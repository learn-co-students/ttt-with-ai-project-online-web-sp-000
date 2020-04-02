module Players
    class Human < Player
    
        def move(board)
            board.display
            puts "Please enter 1-9:"
            input = gets.strip.to_i
            if board.valid_move?(input)
                board.update(input, self)
            else
                puts "Last time I checked, #{input} isn't included in 1-9."
                puts "Lets try that again. I believe in you!"
                move(board)
            end
            return "#{input}"
        end
    end
end