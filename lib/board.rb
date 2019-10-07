class Board
  attr_accessor :cells
  
  @cells = []
  
  def initialize
    reset!
  end
  
  def reset!
    self.cells = Array.new(9, " ")
  end
  
  def display
    p " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    p "-----------"
    p " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    p "-----------"
    p " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(user_input)
    converted_input = user_input.to_i-1
    self.cells[converted_input]
  end
  
  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end
  
  def turn_count
    self.cells.count("X") + self.cells.count("O")
  end
  
  def taken?
    
  end
end