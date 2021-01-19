class Board

    attr_accessor :cells

    def initialize
        self.reset!
    end

    def reset!
        self.cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} " 
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        input = input.to_i 
        input -= 1
        @cells[input]
    end

    def full?
        @cells.any?{|cell| cell == " "} ? false : true
    end

    def turn_count
        @cells.select{|cell| cell != " "}.count
    end

    def taken?(cell)
        position(cell) != " " ? true : false
    end

    def valid_move?(cell)
        cell = cell.to_i

        if (1..9).include?(cell) && !taken?(cell)
            true
        else
            false
        end
    end

    def update(input, player)
        input = input.to_i
        input -= 1
        @cells[input] = player.token
    end

end