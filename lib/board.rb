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
    index = input.to_i - 1
    cells[index]
  end
  
  def full?
    @cells.none? {|cell| cell == " " || cell == nil} 
  end
  
  def turn_count
    @cells.count {|cell| cell == "X" || cell == "O"}
  end
  
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end
  
  def valid_move?(input)
    input = input.to_i
    !(taken?(input)) && input.between?(1, 9)
  end
  
  def update(input, player)
    input = input.to_i - 1
    cells[input] = player.token
  end
  
    
  
end