class Board
 attr_accessor :cells
 
 def initialize
   reset!
 end
 
 def display
   puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
   puts "-----------"
   puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
   puts "-----------"
   puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
 end
 
 def position(input)
   cells[input.to_i - 1] 
 end
 
 def full?
   self.cells.none? {|cell| cell == " "}
 end

 def reset!
   self.cells = Array.new(9, " ")
 end
 
 def turn_count
   counter = 0 
   self.cells.each do |token|
     if token == "X" || token == "O"
    counter += 1 
   end
  end
 counter
 end
 
 def taken?(input)
   index = input.to_i - 1 

  if cells[index] == "X" || cells[index] == "O"
    true 
  else 
    false 
  end
 end
 
 def valid_move?(input)
   index = input.to_i - 1
  if index.between?(0, 8) && cells[index] != "X" && cells[index] != "O"
    true
  else
    false
  end
 end
  
 def update(input, player)
   index = input.to_i - 1 
   cells[index] = player.token
 end
  
end