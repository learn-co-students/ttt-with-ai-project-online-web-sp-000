require 'pry'

class Board
    attr_accessor :cells
    attr_reader :player

    def initialize
        @cells = [" ", " ", " "," ", " ", " "," ", " ", " "]
    end

    def reset!
        @cells = [" ", " ", " "," ", " ", " "," ", " ", " "]
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(input)
        index = input.to_i - 1
        self.cells[index]
    end

    def full?
        self.cells.all? {|cell| cell == "X" || cell == "O"} 
    end

    def turn_count
        counter = 0
        self.cells.each do |cell|
            if cell == "X" || cell == "O"
                counter += 1
            end
        end
        counter
    end

    def taken?(input)
        index = input.to_i - 1
        self.cells[index] == "X" || self.cells[index] == "O"
    end

    def valid_move?(input)
        input = input.to_i 
        input.between?(1,9) && !taken?(input)
    end

    def update(position, player)
        index = position.to_i - 1
        self.cells[index] = player.token
    end
end