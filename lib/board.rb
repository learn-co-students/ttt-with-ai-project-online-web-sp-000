 require 'pry'
 class Board
   attr_accessor :cells

   def initialize
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

   def position(user_input)
     @cells[user_input.to_i - 1]
   end


   def full?
     cells.all? {|cell| cell == "X" || cell == "O"}
   end

   def turn_count  # iterate and count to look at each element of cells and if there is an x or o it increments the count
     #@cells.collect {|x| x == " "}.size / 3
     cells.count do |token|
       token == "X" || token == "O"
     end 
   end

   def taken?(position)
     cells[position.to_i - 1] == "X" || cells[position.to_i - 1] == "O"
   end


    def valid_move?(position)
      !taken?(position) && position.to_i.between?(1,9)
    end

    def update(position, player)
      cells[position.to_i - 1] = player.token
    end


end
