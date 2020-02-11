class Board 
    attr_accessor :cells

    def initialize
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    
    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        cells[input.to_i - 1]
    end

    def full?
        cells.all?{|cell| cell != " "}
    end

    def turn_count
        cells.count{|cell| cell != " "}
    end

    def taken?(index)
        cells[index.to_i - 1] != " "
    end

    def valid_move?(index)
        int = index.to_i 
        !taken?(int) && int.between?(1,9)
    end

    def update(input, player)
        cells[input.to_i - 1] = player.token
    end

end 

# board = Board.new
# binding.pry