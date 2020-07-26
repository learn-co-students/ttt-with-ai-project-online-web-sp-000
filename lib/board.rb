class Board 
  
  attr_accessor :cells
  
  def initialize
    @cells = []
    self.reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def position(input)
    @cells[input_to_index(input)]
  end
  
  def update(position, player)
    @cells[input_to_index(position)] = player.token
  end 
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def position_taken?(index)
    @cells[index] != " "
  end

  def valid_move?(position)
    !taken?(position) && input_to_index(position).between?(0,8)
  end

  def turn_count
    @cells.count{|square| square != " " }
  end
  
  def taken?(pos)
    position(pos) != " "
  end

  def full?
    @cells.all?{|square| square != " " }
  end
  
end