module Players
    class Computer < Player
        def move(board)
            # binding.pry
            if token == "X"
                # Move to a corner space [0,2,6,8]-index / [1,3,7,9]-user input
                if board.valid_move?("1")
                    "1"
                elsif board.valid_move?("3")
                    "3"
                elsif board.valid_move?("7")
                    "7"
                elsif board.valid_move?("9")
                    "9"
                # Move to the opposite corner if '0', then '8' [0,8],[2,6],[6,2],[8,0] / [1,9],[3,7],[7,3],[9,1]
                # Try and fill in a 'cross' spot [1,3,5,7] / [2,4,6,8]
                # Try and fill 3 of the corners.
                elsif board.valid_move?("2")
                    "2"
                elsif board.valid_move?("4")
                    "4"
                elsif board.valid_move?("6")
                    "6"
                elsif board.valid_move?("8")
                    "8"
                elsif board.valid_move?("5")
                    "5"
                # Fill in any empty spaces
                end
            end
        end
    end
end