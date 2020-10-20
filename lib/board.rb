class Board
    attr_accessor :cells

    def initialize
        reset!
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        input = input.to_i - 1
        @cells[input]
    end

    def full?
     !@cells.include?(" ") ? true : false
    end

    def turn_count
        @cells.count {|turn| turn == "X" || turn == "O"}
    end

    def taken?(pos)
      pos = position(pos)
      pos == "X" || pos == "O" ? true : false
    end

    def valid_move?(input)
      input = input.to_i
      input > 0 && input <= 9 && !taken?(input) ? true : false
    end

    def update(input, player)
       input = input.to_i - 1
       @cells[input] = player.token
    end
end
