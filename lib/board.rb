class Board
  attr_accessor :cells
  
  def initialize
    reset!
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
  
  def position(user_input)
    @cells[Integer(user_input) - 1 ]
  end
  
  def full?
    @cells.none?{ |cell|  cell == " " }
  end
  
  def turn_count
    cells.count{ |item|  item != " " }  
  end
  
  def taken?(user_input)
    " " != position(user_input)
  end
  
  def valid_move?(user_input)
    begin
      int_move = Integer(user_input) 
    rescue
      false
    else
      int_move.between?(1,9) && !taken?(int_move)
    end
  end
  
  def update(move, player)
    return false unless valid_move?(move)
    @cells[Integer(move) - 1 ] = player.token
  end
  
end