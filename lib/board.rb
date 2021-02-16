class Board 
  attr_accessor :cells
  
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
  @cells[input.to_i - 1]
  end
  
  def full?
  @cells.all? do |token|
    token == "X" || token == "O"
  end  
  end 
  
  def turn_count
  counter = 0
  @cells.each do |move|
  if move == "X" || move == "O"
  counter += 1
  end 
  end
  return counter
  end  
  
  def taken?(input)
  @cells[input.to_i-1] == "X" || @cells[input.to_i-1] == "O" 
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end
  
  def update(position,player)
    index = position.to_i-1
    @cells[index] = player.token
    
  end 
  
end 