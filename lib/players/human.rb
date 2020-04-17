module Players
    class Human < Player
        
        def move(board)
            puts "Where would you like to move?"
            user_input = gets
            user_input
        end
    end
  end