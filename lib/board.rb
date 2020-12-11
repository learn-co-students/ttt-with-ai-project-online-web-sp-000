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
    
end