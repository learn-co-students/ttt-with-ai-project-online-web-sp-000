require 'pry'

module Players
    class Computer < Player
        # def move(board)
        #     input = 1
        #     until board.valid_move?(input) do
        #         input += 1
        #     end
            
        #     input.to_s
        # end 
        def move(board)
            if !board.taken?("5")
                input = "5"
            else
                input = 1
                until board.valid_move?(input) do
                    input += 1
                end
            end
            input.to_s
        end 

        # def select_move(board)
        #     board.cells.select
        # end
    end
end