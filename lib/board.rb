require 'pry'
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
        (@cells[position.to_i - 1] == "X") || (@cells[position.to_i - 1] == "O")
      end 
      
      def valid_move?(position) #If the position is between 1-9 
        if position.to_i.between?(1, 9) && !taken?(position) #If the position is NOT taken 
            true 
        end 
      end

      def update(user_input, player)
        if valid_move?(user_input) # If the user chooses a vaild move 
            token = self.current_player #Find token value from player 
            @cells[user_input.to_i - 1] = token #update board while converting input to index 
        end 
      end 

      def current_player
        turn_count.even? ? "X" : "O"
    end
end 