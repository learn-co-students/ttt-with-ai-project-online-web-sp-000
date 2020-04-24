class Board
  attr_accessor :cells
  def initialize
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

  def position(num)
    self.cells[num.to_i-1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    9 - self.cells.count(" ")
  end

  def update(index, player)
    if valid_move?(index)
      self.cells[index.to_i - 1] = player.token
    end
  end

  def taken?(index)
    self.cells[index.to_i - 1] != " "
  end

  def valid_move?(index)
    !taken?(index) && index.to_i.between?(1, 9)
  end


end

# board = Board.new
# print board.valid_move?("1")
