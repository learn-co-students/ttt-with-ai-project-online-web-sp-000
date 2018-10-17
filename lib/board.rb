class Board
  attr_accessor :cells, :count
  
  def initialize
    @cells = Array.new(9) { " " }
  end
  
  def reset!
    @cells = Array.new(9) { " " }
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
    cells.all? { |pos| pos == "X" || pos == "O" }
  end
  
  def turn_count
    @count = 0
    cells.each do |pos|
      @count += 1 unless pos == " "
    end
    @count
  end
  
  def taken?(index)
    position(index) == "X" || position(index) == "O"
  end
  
  def valid_move?(index)
    num = index.to_i
    return true if num.between?(1, 9) && !(taken?(index))
  end
  
  def update(index, player)
    num = index.to_i
    cells[num - 1] = player.token
  end
end