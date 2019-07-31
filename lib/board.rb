require 'pry'

class Board

    attr_accessor :cells

    def initialize
        reset!
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
        i = input.to_i - 1
        self.cells[i]
    end

    def full?
        !self.cells.include?(" ")
    end

    def turn_count
        self.cells.count { |cell| cell == "X" || cell == "O" }
    end

    def taken?(input)
        i = input.to_i - 1
        self.cells[i] != " "
    end

    def valid_move?(input)
        i = input.to_i - 1
        i.between?(0,8) && !taken?(input)
    end

    def update(input, player)
        i = input.to_i - 1
        self.cells[i] = player.token
    end

end