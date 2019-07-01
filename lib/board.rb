class Board
  
  attr_accessor :cells
  
  def initialize 
    self.reset!
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(position)
    position = position.to_i
    position-=1
    @cells[position]
  end
  
  def full?
    !@cells.any? {|x| x == "" || x == " "}
  end
  
  def turn_count
    x = @cells.count("X")
    o = @cells.count("O")
    x + o
  end
  
  def taken?(position)
    position = position.to_i 
    position-=1 
    !(@cells[position].nil? || @cells[position] == " ")
  end
  
  def valid_move?(position)
    position = position.to_i 
    !self.taken?(position) && position.between?(1,9)
  end
  
  def update(position, player)
    position = position.to_i 
    position-=1 
    @cells[position] = player.token
  end
end