module Players
  class Computer < Player

    attr_accessor :board

    def move(board)
        computer_move = rand(1..9)
        # binding.pry
        if !board.taken?(computer_move)
            sleep 2
            return computer_move.to_s
            # board.update(computer_move, char)
        end
    end
end 

end