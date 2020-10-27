class Board
    attr_accessor :cells

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def initialize
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(cell)
        @cells[cell.to_i - 1]
    end

    def full?
        position_taken = @cells.map do |cell|
            cell.include?('X') || cell.include?('O')
        end

        position_taken.all?(true)
    end

    def turn_count
        @cells.filter{|cell| cell == 'X' || cell == 'O'}.length
    end

    def taken?(cell)
        @cells[cell.to_i - 1].include?('X') || @cells[cell.to_i - 1].include?('O')
    end
    
    def valid_move?(cell)
        return false if cell === 'invalid'
        @cells[cell.to_i - 1].include?(' ')
    end

    def update(cell, player)
        index = cell.to_i - 1
        @cells[index] = 'X'
    end
end