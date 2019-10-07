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
  
  def position(input)
    input = gets.strip
    converted = input.to_i - 1 
    if converted != (0..9)
      nil
    else
      p "#{self.cells[converted]}"
    end
  end
end