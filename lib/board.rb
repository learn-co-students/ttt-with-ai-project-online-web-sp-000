class Board 
    attr_accessor :cells 

    def reset! 
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "] 
    end 

    def initialize 
        self.reset! 
    end 

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
      end

      def position(user_input) 
        @cells [user_input.to_i - 1] 
      end 

      def full?
        @cells.none? {|pos| pos == " "}
      end 

      def turn_count 
        @cells.count {|pos| pos != " "}
      end 

      def taken?(position)
        !(@cells[position.to_i] == " ")
      end 
end 