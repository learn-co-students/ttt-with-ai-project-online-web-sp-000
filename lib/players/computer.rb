module Players

    class Computer < Player

        def move(board)
            x = 1
            available_positions = []
            priority = []
            my_moves = []
            your_moves = []
            board.cells.each do |pos|
                if board.taken?(x) == false
                    available_positions << x
                    if x == 1 || x == 3 || x == 7 || x == 9
                        priority << x
                    end
                    x += 1
                elsif board.taken?(x) && "#{pos}" == self.token
                    my_moves << x-1
                    x += 1
                else
                    your_moves << x-1
                    x += 1
                end
            end
            if your_moves.length > 1 
                Game::WIN_COMBINATIONS.each do |combo|
                    h = combo & my_moves
                    i = (combo - h).pop
                    if 1 < h.length  && available_positions.include?(i + 1)                
                        board.update(i + 1, self)
                        return "#{i}"
                    end                   
                end 
                Game::WIN_COMBINATIONS.each do |combo|
                    j = combo & your_moves
                    k = (combo - j).pop
                    if 1 < j.length  && available_positions.include?(k + 1)
                        board.update(k + 1, self)
                        return "#{k}" 
                    end
                end                                  
                if priority
                    position = priority[rand(priority.length)]
                    board.update(priority[rand(priority.length)], self)
                    return "#{position}"
                else
                    position = available_positions[rand(available_positions.length)]
                    board.update(available_positions[rand(available_positions.length)], self)
                    return "#{position}"
                end 
            elsif my_moves == []
                pos = priority[rand(priority.length)]
                board.update(pos, self)
                return "#{pos}"
            elsif my_moves.length == 1 && priority
                pos = priority[rand(priority.length)]
                board.update(priority[rand(priority.length)], self)
                return "#{pos}"
            end

        end

    end

end