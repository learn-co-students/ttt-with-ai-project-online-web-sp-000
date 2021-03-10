require "pry"
class Board 
  attr_accessor :cells
  
  def initialize(board=nil) #creates the board with 9 " "
    @cells = Array.new(9, " ")
  end
  
  def cells 
    @cells
  end 
  
  def reset!
    @cells = Array.new(9, " ")
  end 
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(index)
    input = (index.to_i)
    @cells[input-1]
  end 
  
  def full?
    if @cells.detect {|i| i == " "}
      return false
    else
      return true
    end
  end
  
  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end
  
  def taken?(index) ###
    input = (index.to_i)#####->must make better you twat
    !(@cells[input-1].nil? || @cells[input-1] == " ")
  end
  
   def valid_move?(position)
    !taken?(position) && position.to_i >0 && position.to_i <=9
  end
  
  def update(position, player)
      self.cells[position.to_i-1] = player.token
  end
  
#true end right below!  
end 