require 'pry'
class Board
    attr_accessor :cells 
    def initialize
        reset!
    end
    
    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        input.to_i.between?(1,9) ? cell = input.to_i - 1 : nil
        cells[cell]
    end

    def full?
        cells.none? {|cell| cell == " "}
    end
    
    def turn_count
    #   returns the amount of turns based on cell value (FAILED - 9)
        cells.select {|cell| cell != " "}.length
    end
    
    def taken?(input)
    #   returns true if the position is X or O (FAILED - 10)
    #   returns false if the position is empty or blank (FAILED - 11)
        position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input)
    #   returns true for user input between 1-9 that is not taken (FAILED - 12)
        input.to_i.between?(1,9) && !taken?(input)
    end
    
    def update(input, player)
        #   updates the cells in the board with the player token according to the input (FAILED - 13)
        where = input.to_i - 1
        cells[where] = player.token
    end
end