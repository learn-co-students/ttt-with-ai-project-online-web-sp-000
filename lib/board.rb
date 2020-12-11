class Board
    attr_accessor :cells

    def initialize 
        self.reset
    end

    def reset
        @cells = Array.new(9, " ")
    end
end