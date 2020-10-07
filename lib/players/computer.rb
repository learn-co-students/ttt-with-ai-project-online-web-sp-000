module Players
    class Computer < Player

        def move(board)
            puts "The computer is entering a number."
            prng = Random.new
            input = prng.rand(1..9).to_s
        end 

    end 
end 