class Board 
  attr_accessor :cells 
  
  def initialize
    @cells = Array.new(9, " ")
  end 
  
  def reset! 
    @cells = Array.new(9, " ")
  end 
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end 
  def position(pos)
    cells[pos.to_i - 1]
  end 
  def full? 
    cells.all?(/[XO]/) ? true : false  
  end 
  def turn_count 
    count = 0 
    cells.each do |c|
      count += 1 if c == "X" || c == "O"
    end 
    count 
  end 
  def taken?(pos)
    position(pos) == "X" || position(pos) == "O" ? true : false
  end 
  def valid_move?(pos)
    !taken?(pos) && pos.to_i.between?(1, 9) ? true : false
  end 
  def update(pos, player)
    cells[pos.to_i - 1] = player.token if valid_move?(pos) 
  end 
end 