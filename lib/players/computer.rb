module Players
    class Computer < Player
        def move(board)
            array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            array_two = array.map do |n|
            if board.valid_move?(n)
                n
            end
        end
            # array = []
            #     board.cells.each_with_index do |o, index|
            #     if o == " "
            #         index = index.to_i + 1

            #        index = index.to_s
            #          array << index
                  
            #     end
            # end
            if board.cells[4] == " "
                return "4"
            end

            array_two[0]
        end
    end
end