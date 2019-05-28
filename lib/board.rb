class Board
  attr_accessor :cells
  
  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end
  
  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end
  
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def position(input)
    self.cells[input_to_index(input)]
  end
  
  def update(input, player)
    self.cells[input_to_index(input)] = player.token if valid_move?(input)
  end
  
  def full?
    !self.cells.detect {|cell| cell != "X" && cell != "O"}
  end
  
  def turn_count
    self.cells.select {|cell| cell == "X" || cell == "O"}.count
  end
  
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end
  
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input) 
  end
end