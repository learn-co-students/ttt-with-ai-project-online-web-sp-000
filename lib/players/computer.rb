module Players

    class Computer  < Player 
        def move(board)
            puts "Enter a number 1-9: "
            array = []
            board.cells.each_with_index{|space, i| space == " " ? array << (i+1).to_s : nil }
            array[rand(array.length)]
        end
    end
    
end