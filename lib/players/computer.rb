module Players
    class Computer < Player

        def move(computer_move)
            input = (1 + rand(9)).to_s
            if computer_move.valid_move?(input) == false
                self.move
            else
                return input
            end
        end
    end
end