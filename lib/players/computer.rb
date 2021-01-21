module Players
    class Computer < Player
        def move(board)
            movement = ""
            board.cells.each.with_index do |position, index|
                if !board.taken?(position)
                    #binding.pry
                    index +=1
                    movement = "#{index}"                
                end
            end
            movement
        end
    end
end