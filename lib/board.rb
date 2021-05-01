

class Board
  
  attr_accessor :cells 
  
  def initialize
    self.reset!
  end 
  
  
  def reset! 
   self.cells = Array.new(9," ")
  end 
  
  def display
    x = self.cells 
    
    puts " #{x[0]} | #{x[1]} | #{x[2]} "
    puts "-----------"
    puts " #{x[3]} | #{x[4]} | #{x[5]} "
    puts "-----------"
    puts " #{x[6]} | #{x[7]} | #{x[8]} "
    
  end 
  
  def position(user_input)
    index_postion = user_input.to_i - 1
    self.cells[index_postion]
  end 
  
  def full? 
    !self.cells.include?(" ") 
  end 
  
  def turn_count
    9 - self.cells.count(" ")
  end 
  
  def taken?(index)
    
    if position(index) == " "
      false
    else 
      true 
    end 
  end 
  
  def valid_move?(input)
    x = input.to_i
    
    if x.between?(1,9) && taken?(input) == false 
      true 
    else 
     false 
    end 
  end 
  def update(user_input, player)
    index_postion = user_input.to_i - 1
    self.cells[index_postion] = player.token
  end 
end 