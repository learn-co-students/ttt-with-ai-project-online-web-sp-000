class Board
  attr_accessor :cells


  def initialize
    #self.board = board
    @cells = Array.new(9," ")
  end

  def reset!
   self.cells = Array.new(9," ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.all? {|cell| cell != " "}
  end

  def turn_count
    self.cells.count("O") + self.cells.count("X")
  end

  def taken?(position)
    self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O"
  end

  def valid_move?(position)
    !taken?(position.to_i) && position.to_i >0 && position.to_i <=9
  end

  def update(position, player)
    self.cells[position.to_i-1] = player.token

  end

end
