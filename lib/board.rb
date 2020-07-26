class Board 
  attr_accessor :cells
  
  def initialize 
    @cells = Array.new(9, ' ')  
  end 
  
  def reset! 
    @cells = Array.new(9, ' ') 
  end 
  
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(position)
    @cells[position.to_i - 1]
  end
  
  def full? 
    @cells.none?(" ")
  end
  
  def turn_count 
    @cells.count{|i| i == "X" || i == "O"}
  end

  def taken?(position)
    position(position) == "X" || position(position) == "O"
  end 
  
  def valid_move?(move)
    !taken?(move) && move.to_i > 0 && move.to_i < 10
  end

  def update(move, player)
    move = move.to_i-1
    @cells[move] = player::token
  end 

end 

