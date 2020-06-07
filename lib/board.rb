class Board
    attr_accessor :cells, :reset
    def cells
       cells =[]
    end
    def reset!
        cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
end