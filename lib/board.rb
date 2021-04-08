require 'pry'

class Board

    attr_accessor :cells, :token

    def initialize
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts ""
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
        puts ""
    end

    def position(input)
        pos = input.to_i - 1
        # binding.pry
        @cells[pos]
    end

    def full?
        @cells.none?(" ")
    end

    def turn_count
        @cells.count {|c| c != " "}
    end

    def taken?(input)
        position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input)
        !taken?(input) && input.to_i.between?(1,9)
    end

    def update(input, player)
        @cells[input.to_i - 1] = player.token
    end

end
