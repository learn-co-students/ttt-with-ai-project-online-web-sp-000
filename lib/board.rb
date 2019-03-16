class Board
  attr_accessor :cells
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
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
    !@cells.any? { |cell| cell == " " }
  end
  
  def turn_count
    9 - @cells.count { |cell| cell == " " }
  end
  
  def taken?(pos)
    @cells[pos.to_i - 1] == "X" || @cells[pos.to_i - 1] == "O"
  end
  
  def valid_move?(pos)
    pos.to_i > 0 && pos.to_i < 10 && !taken?(pos)
  end
  
  def update(pos, player)
    @cells[pos.to_i - 1] = player.token
  end
end
