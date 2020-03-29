class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    turns_left = self.cells.count - self.cells.count { |cell| cell.include?(" ")}
  end

  def taken?(input)
    !self.cells[input.to_i - 1].eql?(" ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end

  def reset!
    self.cells = Array.new(9, " ")
  end
end