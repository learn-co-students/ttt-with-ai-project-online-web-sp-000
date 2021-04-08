module Players
    class Computer < Player

        OPTIONS = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

        def almost_win?(board)
            Game::WIN_COMBINATIONS.detect do |wc| 
                (board.cells[wc[0]] == "X" && board.cells[wc[1]] == "X" && board.cells[wc[2]] == " ") || 
                (board.cells[wc[1]] == "X" && board.cells[wc[2]] == "X" && board.cells[wc[0]] == " ") || 
                (board.cells[wc[2]] == "X" && board.cells[wc[0]] == "X" && board.cells[wc[1]] == " ") ||
                (board.cells[wc[0]] == "O" && board.cells[wc[1]] == "O" && board.cells[wc[2]] == " ") || 
                (board.cells[wc[1]] == "O" && board.cells[wc[2]] == "O" && board.cells[wc[0]] == " ") || 
                (board.cells[wc[2]] == "O" && board.cells[wc[0]] == "O" && board.cells[wc[1]] == " ")
            end
        end

        def move(board)
            corners = ["1", "3", "7", "9"]
            #player 1 - center square
            #player 2 - center square
            #move after first center - any corner
            #check for win combos
            #randomized grabber
            if board.cells == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
                input = 5
            elsif board.cells[4] == " "
                input = 5
            elsif board.cells[0] == " " && board.cells[2] == " " && board.cells[6] == " " && board.cells[8] == " "
                input = corners.sample
            elsif almost_win?(board)
                fill = almost_win?(board).detect {|aw| board.cells[aw] == " "}
                input = fill + 1
            else
                if board.cells[0] == " "
                    input = 1
                elsif board.cells[1] == " "
                    input = 2
                elsif board.cells[2] == " "
                    input = 3
                elsif board.cells[3] == " "
                    input = 4
                elsif board.cells[5] == " "
                    input = 6
                elsif board.cells[6] == " "
                    input = 7
                elsif board.cells[7] == " "
                    input = 8
                elsif board.cells[8] == " "
                    input = 9
                end
            end
            
        end

    end
end



# ["X", "O", "X", " ", "O", " ", "0", "X", "X"]

