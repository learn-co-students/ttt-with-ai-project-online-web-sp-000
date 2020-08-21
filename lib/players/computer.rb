module Players
    attr_accessor :position
    class Computer < Player
        # allows a human player to enter a move via CLI
        def move(board)
            computer_move = rand(8)
            if board.valid_move?(computer_move)
                computer_move.to_s
            else
                move(board)
            end
        end
    end
end