module Players
    class Computer < Player
        def move(board)
            first_empty_index = board.cells.find_index {|cell| cell == " "}
            first_empty_spot = first_empty_index + 1
            first_empty_spot
        end
    end
end
