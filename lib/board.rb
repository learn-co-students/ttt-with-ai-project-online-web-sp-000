class Board
  attr_accessor :cells
  
  def reset!
    self.cells = Array.new(9, " ")
  end
  
  def initialize
    self.reset!
  end
  
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(intended_position)
    self.cells[intended_position.to_i - 1]
  end
  
  def full?
    if self.cells.include?(" ")
      false
    else
      true
    end
  end
  
  def turn_count
    self.cells.count do |cell|
      cell != " "
    end
  end
  
  def taken?(position)
    if self.position(position) == " "
      false
    else
      true
    end
  end
  
  def valid_move?(position)
    if self.taken?(position)
      false
    elsif !(1..9).to_a.include?(position.to_i)
      false
    else
      true
    end
  end
  
  def update(position, player)
    self.cells[position.to_i - 1] = player.token
  end
 
end