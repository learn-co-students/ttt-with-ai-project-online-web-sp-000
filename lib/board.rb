class Board
    attr_accessor :cells
    
    def initialize
        reset!
    end
    
    def display 
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def position(input)
        @cells[input_to_index(input)]
    end

    def full?
        @cells.all? { |cell| cell != " " }
    end

    def turn_count
        @cells.select { |cell| cell != " "}.size
    end

    def taken?(input)
        index = input_to_index(input)
        position(input) != " "
     end

    def valid_move?(input)
        index = input_to_index(input)
        index.between?(0, 8) && !taken?(input)
    end

    def update(input, player)
        if valid_move?(input)
            @cells[input_to_index(input)] = player.token
        end
    end

end