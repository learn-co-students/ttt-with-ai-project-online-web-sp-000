#initial construction by DJTaylor!


require 'pry'

class Board

  attr_accessor :cells, :token
  @cells = []

#in order to pass tests this also had to return the cells array (set above)
#adding an @cells to this returns the value and fixes broken tests 
    def initialize
         reset!
         @cells
    end

    def reset!
        # tests still pass w/o line 18
        # @cells.clear if @cells != nil
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
      end

      def position(user_input)
        index = user_input.to_i - 1
        @cells[index]
      end

      def full?
        @cells.all?{|index| index != " "}
      end

      def turn_count
        counter = 0
        @cells.each do |cell|
            if cell == "X" || cell == "O"
                counter += 1
            end
        end
        counter
      end

      def taken?(index)
        @cells[index.to_i - 1] != " "
      end

      def valid_move?(index)
        index.to_i.between?(1,9) && !taken?(index)
      end

      def current_player
        turn_count.even? ? "X" : "O"
      end

      def move(index, token)
        @cells[index] = token
      end

      def update(input, player)
        @cells[input.to_i - 1] = player.token
      end

end
