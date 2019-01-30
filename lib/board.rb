require 'pry'
class Board
  
  attr_accessor :cells
  
  def initialize
    reset!
  end
  
  def reset!
    @cells = Array.new(9, ' ')
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def index(input)
    input.to_i - 1
  end
  
  def position(input)
    cells[index(input)]
  end
  
  def index_position(index)
    cells[index]
  end
  
  def full?
    cells.count(' ') == 0
  end
  
  def empty?
    cells.count(' ') == 9
  end
  
  def turn_count
    9 - cells.count(' ')
  end
  
  def index_taken?(index)
    index_position(index) != ' '
  end
  
  def taken?(input)
    position(input) != ' '
  end
  
  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end
  
  def update(input, player)
    cells[index(input)] = player.token
  end

end