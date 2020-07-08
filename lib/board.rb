class Board
    attr_accessor :cells

    def initialize
        reset!
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
        i = input.to_i - 1
        cells[i]
    end

    def full?
        @cells.all?{|position| position != " " }
    end

    def turn_count
        @cells.count{|position| position != " " }
    end

    def taken?(input)
        position(input) != " "
    end

    def valid_move?(input)
        !taken?(input) && input.to_i.between?(1,9)
    end

    def update(input, player)
        i = input.to_i - 1
        cells[i] = player.token
    end

end