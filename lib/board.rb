require 'pry'

class Board
 attr_accessor :cells
  
  cells = [" "," "," "," "," "," "," "," "," "]
  
  def reset!
    cells.clear
    cells = Array.new(9, " ")
    binding.pry
    cells
  end
  
  def initialize 
  end
  
  
end