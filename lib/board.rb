class Board
    attr_accessor :cells

    def initialize 
        self.reset
    end

    def reset
        @cells = Array.new(9, " ")
    end

    def user_position
        position = gets.chomp.to_i
        position -= 1
        @cells[x]
    end

    def display 
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]}  \n-------------------------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]}  \n-------------------------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]}"
    end

end