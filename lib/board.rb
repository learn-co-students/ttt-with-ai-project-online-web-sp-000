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
    return nil unless valid_move?(user_input)
    @cells[Integer(user_input) - 1 ]
  end
  
  def full?
    @cells.none?{ |cell|  cell == " " }
  end
  
  def turn_count
    cells.count{ |item|  item != " " }  
  end
  
  def taken?(postion)
    "" != position(position)
  end
  
  def valid_move?(user_input)
    position = Integer(user_input)
    position > 0 && position < 10
  end
  
  def update(move, player_token)
    return false unless valid_move?
    return false unless taken?
    @cells[Integer(move) - 1 ] = player_token
  end
  
end