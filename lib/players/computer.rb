module Players
    class Computer < Player
        
        def move(board)
            index = 1
            @valid_moves = []

            board.display 

            while index < 10
                if board.position(index) === " "
                    @valid_moves.push(index.to_s)
                end
                index +=1
            end

            if board.turn_count === 0
                if @valid_moves.include?("5")
                    "5"
                end
            else
                first_case(board)
            end
        end

        def first_case(board)
            if !@valid_moves.include?("7") && !@valid_moves.include?("4") && (!@valid_moves.include?("9") || !@valid_moves.include?("2"))
                if @valid_moves.include?("9")
                    "9"
                else
                    "2"
                end
            elsif !@valid_moves.include?("7") && !@valid_moves.include?("4")
                "1"
            elsif !@valid_moves.include?("7")
                "3"
            end
        end

    end
end