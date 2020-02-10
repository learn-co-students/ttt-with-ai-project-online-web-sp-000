class Board 
    attr_accessor :cells

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    
    
end 

# board = Board.new
# binding.pry