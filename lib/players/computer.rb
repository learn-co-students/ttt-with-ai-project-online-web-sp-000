module Players
    class Computer < Player
        WIN_COMBINATIONS = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,4,8],
            [2,4,6],
            [0,3,6],
            [1,4,7],
            [2,5,8]
          ]
        def move(board)
            
            #binding.pry
            #if board.turn_count <= 1
            #    @computer_move = rand(1..9).to_s
            #binding.pry
            if board.cells[4] == " " 

                @computer_move = "5"
            elsif corner_available?(board) && board.turn_count <= 2
                
                @computer_move = @corners[rand(0..@corners.length - 1)]
                puts "took corner"
                #binding.pry
            #elsif side_available?(board) && board.turn_count <= 2
            #    @computer_move = @side[rand(0..@side.length - 1)]
                #binding.pry
            elsif one_move_away?(board)
                
                @computer_move = one_move_away?(board)
                #binding.pry
            else
                @computer_move = rand(1..9).to_s
                
            end

            if board.valid_move?(@computer_move)
                #binding.pry
                board.update(@computer_move, self)
            end
            @computer_move
        end
        def corner_available?(board)
            
            @corners = []
            if board.cells[0] == " "
                @corners << "1"
            end
            if board.cells[2] == " "
                @corners << "3"
            end
            if board.cells[6] == " "
                @corners << "7"
            end
            if board.cells[8] == " "
                @corners << "9"
            end
            #binding.pry
            if @corners.length > 0
                true
            else
                false
            end
        end
        def side_available?(board)
            @side = []
            if board.cells[1] == " "
                @side << "2"
            end
            if board.cells[4] == " "
                @side << "5"
            end
            if board.cells[3] == " "
                @side << "4"
            end
            if board.cells[5] == " "
                @side << "6"
            end
            if board.cells[7] == " "
                @side << "8"
            end
            if @side.length > 0
                true
            else
                false
            end
        end
        def one_move_away?(board)
            # @player = self.token
            # @available_cells = []
            # board.cells.each_with_index {|cell, index| 
            #     if cell == " "
            #         @available_cells << index
            #     end
            # }
            # @available_cells = @available_cells.sort
            # old code
            # if (board.cells[c[0]] == "X" && board.cells[c[1]] == "X" && board.cells[c[2]] == " ") ||
            #     (board.cells[c[0]] == "O" && board.cells[c[1]] == "O" && board.cells[c[2]] == " ") ||
            #     (board.cells[c[0]] == "X" && board.cells[c[1]] == " " && board.cells[c[2]] == "X") ||
            #     (board.cells[c[0]] == "O" && board.cells[c[1]] == " " && board.cells[c[2]] == "O") ||
            #     (board.cells[c[0]] == " " && board.cells[c[1]] == "X" && board.cells[c[2]] == "X") ||
            #     (board.cells[c[0]] == " " && board.cells[c[1]] == "O" && board.cells[c[2]] == "O")
            
            @computer_token = self.token
            if @computer_token == "X"
                @opponent_token = "O"
            else
                @opponent_token = "X"
            end
            #binding.pry
            #check if self is one move away from winning
            WIN_COMBINATIONS.each {|c| 
                
                if (board.cells[c[0]] == @computer_token && board.cells[c[1]] == @computer_token && board.cells[c[2]] == " ") ||
                   (board.cells[c[0]] == @computer_token && board.cells[c[1]] == " " && board.cells[c[2]] == @computer_token) ||
                   (board.cells[c[0]] == " " && board.cells[c[1]] == @computer_token && board.cells[c[2]] == @computer_token) 
                   
           
                   #binding.pry
                   #return position to win
                   if board.cells[c[0]] == " "
                    return (c[0] + 1).to_s
                   elsif board.cells[c[1]] == " "
                    return (c[1] + 1).to_s
                   elsif board.cells[c[2]] == " "
                    return (c[2] + 1).to_s
                   end
                   #c
                end
                
            }
            #check if opponent is one move away from winning and block
            puts "blocked!"
            WIN_COMBINATIONS.each {|c| 
                
            if (board.cells[c[0]] == @opponent_token && board.cells[c[1]] == @opponent_token && board.cells[c[2]] == " ") ||
                (board.cells[c[0]] == @opponent_token && board.cells[c[1]] == " " && board.cells[c[2]] == @opponent_token) ||
                (board.cells[c[0]] == " " && board.cells[c[1]] == @opponent_token && board.cells[c[2]] == @opponent_token) 
       
               #binding.pry
               if board.cells[c[0]] == " "
                return (c[0] + 1).to_s
               elsif board.cells[c[1]] == " "
                return (c[1] + 1).to_s
               elsif board.cells[c[2]] == " "
                return (c[2] + 1).to_s
               end
               #c
            end
            
            }
            false
        end

    end
end