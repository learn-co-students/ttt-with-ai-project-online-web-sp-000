class Board

    attr_accessor :cells

    def initialize
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        input = input.to_i
        cells[input - 1]
    end

    def full?
        cells.all?{|space| space == "X" || space == "O"}
     end

     def turn_count
        cells.count{|space| space == "X" || space == "O"}
     end

     def taken?(input)
        if  position(input) == "X" || position(input) == "O"
            true
        else 
            false
        end
     end

     def valid_move?(input)
        input = input.to_i
         if input.between?(1,9) && !taken?(input)
            true
         else
            false
         end
     end

     def update(input, player)
        input = input.to_i
        cells[input -1] = player.token
    end

end