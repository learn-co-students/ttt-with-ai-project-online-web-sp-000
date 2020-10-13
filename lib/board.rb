class Board
    attr_accessor :cells
    @cells = []

    def initialize
        @cells = Array.new(9, " ")
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(pos_num)
        # returns array[pos_num -1]
        @cells[pos_num.to_i - 1]
    end

    def full?
        # use a iterator that returns a boolean
        @cells.all? {|i| i == "X" || i == "O"}
    end

    def turn_count
        count = 0
        @cells.each do |i|
            if i == "X" || i == "O"
                count += 1
            end
        end
        count
    end

    def taken?(pos)
        pos = pos.to_i - 1
        @cells.all? {@cells[pos] == "X" || @cells[pos] == "O"}
    end 
    
    def valid_move?(pos)
        pos = pos.to_i 
        pos >= 1 && pos <= 9 && !taken?(pos)
    end
    
    def update(pos, player)
        pos = pos.to_i - 1
        @cells[pos] = player.token
    end 
end           
           
