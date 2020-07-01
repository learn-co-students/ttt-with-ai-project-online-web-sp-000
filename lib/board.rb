require 'pry'
class Board
    attr_accessor :cells, :player

    def initialize
        reset!
    end

    def reset!
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(input)
        #binding.pry
        input = input.to_i
        @cells[input - 1]
    end

    def full?
        if @cells.detect{|i| i == "" || i == " " || i == nil}
          return false
        else
          return true
        end
    end

    def turn_count
        @cells.count {|cell| cell == "X" || cell == "O"}
    end

    def taken?(input)
        position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input)
        input = input.to_i
        !(taken?(input)) && input.between?(1, 9)
    end

    def update(input, player) 
        #binding.pry
        position(input)  
    end
end