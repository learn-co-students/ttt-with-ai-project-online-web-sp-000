require 'pry'

class Board
 attr_accessor :cells
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
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
   @cells[input.to_i - 1]
  end 
  
  def full?
   @cells.each do |cell|
      if cell == " "
        return false  
      end 
    end
  end
  
  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end
  
  def taken?(input)
   !(position(input).nil? || position(input) == " ")
  end
  
  def valid_move?(input)
    binding.pry
    input.between?(0, 8) while !taken?(input)
  end
end