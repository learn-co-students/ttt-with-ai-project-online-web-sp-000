class Board

    attr_accessor :cells

    def initialize
        @cells = Array.new(9," ")
    end

    def reset!
        @cells.clear
        initialize
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(number)
        @cells[number.to_i - 1]
    end

    def full?()
        !@cells.include?(" ")
    end

    def turn_count 
        @cells.count("X") + @cells.count("O")
    end

    def taken?(index)
        position(index) == "X" || position(index) == "O"
    end

    def valid_move?(index)
        !taken?(index) && index.to_i.between?(1,9)
    end

    def update(input, player)
        index = input.to_i - 1
        @cells[index] = player.token
    end


end