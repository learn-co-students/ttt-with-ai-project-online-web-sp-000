require 'pry'

class Board
 attr_accessor :cells, :token
  
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
  
  def input_to_i(input)
    input.to_i
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
    input_to_i(input).between?(1, 9) && !taken?(input)
  end
  
  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
end