# Define a class Players::Computer that represents a computer player of Tic-tac-toe.

# module Players

#     class Computer < Player
#     end

# end
#??(is the above code for the class correct? )

# def move
# end 
#method that accepts a board and returns the move the computer wants to make in the form of a 1-9 string. How the computer decides to make that move is up to you but it must be capable of returning a valid move at some point.
#Think about the levels of intelligence you can build into this method. Start with the simplest level of intelligence, and get more and more complicated. Each step of the way you should have a working computer player though.
#Remember, Tic-tac-toe when played perfectly is unwinnable. You should strive to build computer logic that when the computer plays, the game is unwinnable. You can hardcode your logic, things like "On turn 1 always try to go in the middle if you can" and if not "try to go in a corner" or any logic tree you can think of 

module Players

    class Computer < Player

        def move(board)
            if !board.taken?('5')
              '5'
            else
              best_move(board) + 1
            end
        end

    end

end