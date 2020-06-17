#require_relative '../player.rb'

module Players
    class Human < Player
        def move(board)
            puts "Please enter a value from 1 to 9"
            @input = gets.strip
            #binding.pry

            if @input.to_i.between?(1,9)
            
            else
                move(board)
            end
            if board.valid_move?(@input)
                board.update(@input, self)
            end
            @input
        end
    end
end