module Players
    class Computer < Player
        def move(board)
            array = []
                board.cells.each_with_index do |o, index|
                if o == " "
                    index = index.to_i + 1
                   index = index.to_s
                     array << index
                  
                end
            end
            if board.cells[4] == " "
                return "4"
            end

            array[0]
        end
    end
end