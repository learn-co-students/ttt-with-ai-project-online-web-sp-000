require 'pry'

class Board
    attr_accessor :cells

    def initialize
        reset!
        #Calls the reset method to start a new board
    end 

    def cells
        @cells 
        #Returns the board, since cells is now called board I guess
    end 

    def reset!
        @cells = Array.new(9, " ")
        #Clears the board! Redefines @cells as a new empty array
    end 

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
        #Displays the board layout
    end 
    
    def position(input)
        @cells[input.to_i - 1]
        #Puts the user input in the @cells array/on the board
        #Note: Does NOT take in user input in this method specifically
    end 

    def full?
        if @cells.include?(" ")
            false
        else
            true 
        end 
        #If the cells include a blank space obviously it's not full
    end 

    def turn_count
        counter = 0
        @cells.each do |pos|
            if pos == "X" || pos == "O"
                counter += 1
            end
        end 
        counter
        #Iterating through the board to count all the Xs and Os.
    end 

    def taken?(input)
        if position(input) == "X" || position(input) == "O"
            true
        else 
            false
        end 
        #If the position has an X or an O it is taken
    end 

    def valid_move?(input)
        if input.to_i.between?(1,9) && taken?(input) == false
            true
        else 
            false 
        end
    end 

    def update(input, player)
        @cells[input.to_i - 1] = player.token
        # player = double("player", :token => "X")
        #Therefore player should be player.token so it fills properly
        #No I don't know what the format means either
    end
end 