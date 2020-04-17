module Players
    class Computer < Player

        def move(board)
            valid_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            valid_moves.sample.to_s
        end

    #     WIN_COMBINATIONS = 
    # [
    #     [0, 1, 2],
    #     [3, 4, 5],
    #     [6, 7, 8],
    #     [0, 3, 6],
    #     [1, 4, 7],
    #     [2, 5, 8],
    #     [0, 4, 8],
    #     [2, 4, 6]
    # ]
        
        # def move(board)
        #     move = nil
        #     for combo in WIN_COMBINATIONS
        #         if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == "X" || board.cells[combo[0]] == "O"
        #             move = combo[2].to_s
        #         elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] == "X" || board.cells[combo[1]] == "O"
        #             move = combo[0].to_s
        #         else
        #             valid_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        #             move = valid_moves.sample.to_s
        #         end
        #     end
        #     move
        # end
    end
end