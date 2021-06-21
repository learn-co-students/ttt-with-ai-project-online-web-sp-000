module Players
    class Computer < Player
        def move(board)
            if !board.taken?("5")
                "5"
            elsif board.turn_count == 1
                "1"
            elsif board.turn_count == 2
                next_move(board)
            else
                last_moves(board)
            end
        end
            
        def next_move(board)
            move = [8,6,2,0].find {|cell| !board.taken?(cell)}.to_s
            move
        end 
        def last_moves(board)
            move = [7,5,3,1,8,6,2,0].find {|cell| !board.taken?(cell)}.to_s
            move
        end
    end 
end 