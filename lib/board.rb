class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position (value)
    self.cells[value.to_i - 1]
  end

  def full?
    self.cells.all? {|cell| cell != " "}
  end

  def turn_count
    count = 0
    self.cells.each {|cell| count += 1 if cell != " "}
    count
  end

  def taken? (value)
    if self.cells[value.to_i - 1] == " "
      false
    else
      true
    end
  end

  def valid_move? (value)
    if value.to_i < 1 || value.to_i > 9 || taken?(value)
      false
    else
      true
    end
  end

  def update (value, player)
    self.cells[value.to_i - 1] = player.token
  end
end
