require 'pry'

class Board
  attr_accessor :cells

   def initialize
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
   end

   def reset!
     @cells.clear
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
   end

   def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
   end

   def position(number)
     @cells[number.to_i - 1]
   end

   def full?
     array = @cells.map{ |cell| cell.strip}.reject{ |element| element.empty? }
     if array.length == 9
       return true
     elsif array.length < 9
       return false
     end
   end

   def turn_count
     @cells.count("X" || "O") + 1
   end

   def taken?(position)
     @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O"
   end

   def valid_move?(move)
     if !taken?(move) && move.to_i.between?(1, 9)
       true
     else
       false
     end
   end

end
