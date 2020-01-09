module Players
    class Computer < Player
        def move(board)
            rand(1..9).to_s
        end
    end
end

# refactor idea:
# map with index the available positions, and shuffle them
# to reduce collisions
# iterate over win_combinations and find win combinations with
# 1 or 2 tokens already, and try to win.
# could use same logic to block opponent