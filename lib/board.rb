# rspec spec/01_board_spec.rb

class Board
  attr_accessor :cells, :move_box
  
  def initialize
    @cells = Array.new(9, " ")
    @move_box = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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
  
  def position(input)
    @cells[input.to_i - 1]
  end
  
  def full?
    !@cells.include?(" ")
  end
  
  def turn_count
    9 - @cells.count(" ")
  end
  
  def taken?(input)
    position(input) != " "
  end
  
  def valid_move?(input)
    !taken?(input) && !full? && input.to_i.between?(1, 9)
  end

  def update(input, player_oi)
    @cells[input.to_i - 1] = player_oi.token
  end
  
  def update_move_box(input)
    @move_box.delete_at(@move_box.index(input.to_i))
  end

end
  