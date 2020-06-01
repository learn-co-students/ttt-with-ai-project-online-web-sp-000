class Board
    attr_accessor :cells

    def initialize
        self.reset!
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        row = "------------"

        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts row
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts row 
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def input_to_index(input)
        (input.to_i) - 1 
    end

    def position(input)
        index = self.input_to_index(input)
        self.cells[index]
    end

    def update(input, player)
        index = self.input_to_index(input)
        self.cells[index] = player.token
    end

    def full?
        if (self.cells.include?("") == true || self.cells.include?(" ") == true || self.cells.include?(nil) == true)
            false
        else
            true
        end
    end

    def taken?(input)
        if (self.position(input) == "X" || self.position(input) == "O")
            true
        else
            false
        end
    end

    def valid_move?(input)
        if (self.input_to_index(input) >= 0 && self.input_to_index(input) <= 8 && self.taken?(input) == false)
            true
        else
            false
        end
    end

    def turn_count
        self.cells.count {|cell| cell == "X" || cell == "O"}
    end
end

