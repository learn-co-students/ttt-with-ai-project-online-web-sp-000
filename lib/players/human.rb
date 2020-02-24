
module Players
    class Human < Player

        def move(board)
            puts "Please choose a position by typing: 1-9"
            gets.strip
        end

    end
end


# Players::Human
# Define a class Human that inherits from Player. This class should be namespaced inside the module Players because the human.rb file is inside the players/ directory

# def move
# end
# method that takes in a board argument and allows a human player to enter a move via the CLI. The method should return the value the user enters. Even though the method accepts a board argument, it does not need to use it.

#?? Now when you call your Human class, you'll have to call it inside its name space with 
#Players::Human. ?? ( which file does this go in)