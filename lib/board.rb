class Board
    attr_accessor :cells
    def initialize
        @cells = Array.new(9, " ")
    end
    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end
    def position(position)
        @cells[position.to_i - 1]
    end
    def full?
        if @cells.include?(" ")
            false
        else
            true
        end
    end
    def turn_count
        9 - @cells.count(" ")
    end
    def taken?(cell)
        @taken_cell = cell.to_i - 1
        if @cells[@taken_cell] == "X" || @cells[@taken_cell] == "O"
            true
        else
            false
        end
    end
    def valid_move?(cell)
        @valid_cell = cell.to_i
        if @valid_cell.between?(1, 9) && !taken?(cell)
            true
        else
            false
        end
    end
    def update(cell, player)
        @cells[cell.to_i - 1] = player.token
    end
end