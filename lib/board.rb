class Board
    attr_accessor :cells

    def initialize
        self.reset!
    end

    def reset!
        self.cells = Array.new(9, " ")
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(input)
        index = input.to_i
        self.cells[index - 1]
    end

    def full?
        self.cells.each do |cell|
            if cell == " "
                return false
            end
        end
        return true
    end

    def turn_count
        count = 0
        self.cells.each do |cell|
            if cell != " "
                count += 1
            end
        end
        return count
    end

    def taken?(input)
        if position(input) == "X" || position(input) == "O"
            return true
        else
            return false
        end
    end

    def valid_move?(input)
        if input.to_i != 0 && taken?(input) == false
            return true
        else
            return false
        end
    end

    def update(input, player)
        self.cells[input.to_i - 1] = player.token
    end

end