module Players
    class Human < Player 
        def move(board)
            puts "Enter a move (1-9): "
            user_input = gets.chomp
        end 
    end 
end