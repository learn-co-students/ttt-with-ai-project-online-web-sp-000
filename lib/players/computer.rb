module Players
    class Computer < Player

        CORNERS = [1,3,7,9]
        CENTER = 5
        SIDES = [2,4,6,8]
        BARS = [
            [1,2,3],[1,4,7],[3,6,9],[7,8,9]
        ]
        
        def move(board)

            sleep(2)

            puts "I'm thinking real hard here..."

            sleep(2)

            if !!can_win(board)
                move = can_win(board).find{|i| board.position(i+1) == " "} + 1
            elsif !!can_lose(board)
                move = can_lose(board).find{|i| board.position(i+1) == " "} + 1
            elsif board.turn_count < 5
                strategic_move(board)
            else
                move = valid_moves(board).sample.to_s
            end

            # move = valid_moves(board).sample

        end

        def opposite_corner(corner)
            case corner
            when 1
                9
            when 3
                7
            when 7
                3
            when 9
                1
            end
        end

        def strategic_move(board)
            if self.token == "X"

                #Play optimal first player strategy

                if  board.turn_count == 0
                    move = CORNERS.sample.to_s
                    #At first, always start with a corner
                elsif board.turn_count == 2

                    #on second turn, put in trap if they take center. otherwise, find the nonstandard trap.
                    if board.taken?(CENTER)

                    #if center is taken, take opposite corner from first x
                        corner = CORNERS.find{|i| board.taken?(i)}
                        move = opposite_corner(corner)
                        
                    else
                    #if center is not taken, take free corner of first bar with 1 x and two open spaces
                        move = bar_rule(board)

                    end
                else
                    move = bar_rule(board)
                end

            else
                #As second player, assume optimal play. take center first. on turn three, detect ideal play trap. after that, disrupt possible bars.

                if board.turn_count == 1 && !board.taken?(CENTER)
                    move = CENTER
                elsif board.turn_count == 1 && board.taken?(CENTER)
                    #if opponent is taking center and playing defensively, take a corner in response. bar rule and can_win/can_lose will take care of the rest
                    move = CORNERS.sample
                elsif board.turn_count == 3 && CORNERS.any?{|c| board.position(c) == "X" && board.position(opposite_corner(c)) == "O" }
                    #if opponent takes opposite corner in response, play an open corner
                    move = CORNERS.select{|c| !board.taken?(c)}.sample
                elsif board.turn_count == 3 && CORNERS.any?{|c| board.position(c) == board.position(opposite_corner(c))}
                    #break out of ideal trap here
                    move = SIDES.sample
                else
                    bar_rule(board)
                end
                
            end
        end

        def can_win(board)
            Game::WIN_COMBINATIONS.find do |combo|
                combo.select{|i| board.position(i+1) == self.token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            end
        end

        def can_lose(board)
            Game::WIN_COMBINATIONS.find do |combo|
                combo.select{|i| board.position(i+1) == opponent_token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            end
        end

        def opponent_token
            if self.token == "X"
                "O"
            else
                "X"
            end
        end

        def valid_moves(board)
            (1..9).select{|i| board.valid_move?(i)}
        end

        def bar_rule(board)
            bar = BARS.find do |bar|
                bar.select{|i| board.position(i) == " "}.size == 2 && bar.any?{|i| board.position(i) == "X"}
            end

            move = bar.find{|i| CORNERS.include?(i) && board.position(i) == " " }
        end



    end
end

# choice = rand(10)
#                 if board.valid_move?(choice)
#                     board.update(choice, self)
#                     choice.to_s
#                 else
#                     move(board)
#                 end


# board.cells(combo[0] - 1)
                # combo.count(" ") == 1 && combo.uniq.count == 2


                # board_state = board.cells

            

            # puts "I am player #{self.token}"
            # puts "My opponent is #{opponent_token}"

            # threat = Game::WIN_COMBINATIONS.find do |combo|
            #     combo.select{|i| board.cells[i]}.count("#{opponent_token}") == 2 && combo.select{|i| board.cells[i]}.count(" ") == 1
            # end

            # opportunity = Game::WIN_COMBINATIONS.select do |combo|
            #     combo.select{|i| board.cells[i]}.count("#{self.token}") == 2 && combo.select{|i| board.cells[i]}.count(" ") == 1
            # end

            # valid_moves = (1..9).select{|i| board.valid_move?(i)}.to_a

            # if !!opportunity
            #     choice = opportunity.find{|cell| board.valid_move?(cell)}.to_s
            # elsif !!threat
            #     choice = threat.find{|cell| board.valid_move?(cell)}.to_s
            # else
            #     choice = valid_moves.sample.to_s
            # end