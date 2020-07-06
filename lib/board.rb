require 'pry'
class Board
    attr_accessor :player, :token, :cells
    
    def initialize
        reset!
    end

    def reset! # exclamation marks are a sign that it forces something to do something. for example if you are stuck in a loop in pry and you type exit you will remain in pry, but if you type exit! you will force your way out
      @cells = Array.new(9, " ")
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        #binding.pry
        @cells[input.to_i-1] # user input from gets.strip always comes in as a string so we want to turn the string into an integer and then subtract 1 because when they type "1" they really want position [0] in our boards array
    end

    def full? # ? are indicative that it returns true or false. 
        cells.all?{|character| character == "X" || character == "O"}
    end

    def turn_count
        cells.count {|cell| cell == "X" || cell == "O"}
    end

    def taken?(input)
        position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input)
        !taken?(input) && input.to_i.between?(1, 9)
    end

    def update(input, player) 
        @cells[input.to_i - 1] = player.token
    end
end