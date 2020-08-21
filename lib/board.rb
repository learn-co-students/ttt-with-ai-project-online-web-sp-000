require 'pry'
class Board
    attr_accessor :cells, :player, :token

    #stores all data of the board in array
    @cells = []
    
    def initialize
        reset!
    end
    
    # reset the state of the game
    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    # displays tic-tac-toe board
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    #position - takes in user's input & returns the value of the board cell
    def position(input)
        #input = gets.chomp
        index = input.to_i - 1
        @cells[index]
    end

    #update(user_position-1, token (x or o)) - update board when player makes move 

    # entirely occupied with x's & o's
    def full?
        @cells.none?(" ")
    end
    
    # how many positions in cells array are filled
    def turn_count
        count = 0
        @cells.each do |cell|
            if cell != (" ")
                count += 1
            end
        end
        count
    end

    # whether individual position is taken or not
    def taken?(index)
        position(index) == "X" || position(index) == "O"
    end
    
    # ensure moves are between 1 & 9 & not taken
    def valid_move?(index) 
        index = index.to_i
        index.between?(1,9) && !(taken?(index))
    end

    def update(number, player)
        number = number.to_i
        @cells[number-1] = player.token
    end
end

#all other methods will rely on #position method (1-9)