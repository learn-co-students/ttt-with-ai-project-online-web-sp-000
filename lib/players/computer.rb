module Players
    class Computer < Player 
        def move(board)

            if !board.taken?("5")
                "5"
            elsif !board.taken?("1")
                "1"
            elsif !board.taken?("9")
                "9"
# ---------- DIAG 1 -------------
            elsif !board.taken?("7")
                "7"
            elsif !board.taken?("3")
                "3"
#----------- DIAG 2----------------
            elsif !board.taken?("8")
                "8"
            elsif !board.taken?("6")
                "6"
            elsif !board.taken?("2")
                "2"
            elsif !board.taken?("4")
                "4"
            else 
                # ROW 1 = WIN 
                # ROW 2
                # ROW 3 
                # COL 1 = WIN 
                # COL 2 
                # COL 3
                # DIAG 1 = WIN 
                # DIAG 2 = WIN
                # Game::WIN_COMBINATIONS = [[0, 1, 2] WIN, [3, 4, 5], [6, 7, 8], [0, 3, 6] WIN, [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2] WIN]
                Game::WIN_COMBINATIONS.each do |position_array|
                    if board.cells[position_array[0]] == self.token && board.cells[position_array[1]] == self.token
                        position_array[2]
                    elsif board.cells[position_array[1]] == self.token && board.cells[position_array[2]] == self.token
                        position_array[0]
                    elsif board.cells[position_array[0]] == self.token && board.cells[position_array[2]] == self.token
                        position_array[1]
                    end 
                end 
            end 
        end 
    end
end
