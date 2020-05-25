class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
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
  
  def position(pos)
    @cells[pos.to_i - 1]
  end
  
  def full?
    @cells.all? {|e| e != " "}
  end
  
  def turn_count
    @cells.count {|cell| cell != " "}
  end
  
  def taken?(pos)
    position(pos) == "O" || position(pos) == "X"
  end
  
  def valid_move?(pos)
    if (1..9).include?(pos.to_i)
      taken?(pos) ? false : true
    end
  end
  
  def update(pos, player)
    @cells[pos.to_i - 1] = player.token
  end
  
end
    