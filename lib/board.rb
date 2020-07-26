class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
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
    self.cells[input_to_index(input)]
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def full?
    self.cells.all? {|cell| cell != " " && cell != "" && !(cell.nil?)}
  end

  def turn_count
    (self.cells.select {|cell| cell != " " && cell != "" && !(cell.nil?)}).length
  end

  def taken?(input)
    spot = self.cells[input_to_index(input)]
    spot == "X" || spot == "O"
  end

  def valid_move?(input)
    !(taken?(input)) && (1..9).include?(input.to_i)
  end

  def update(input, player)
    self.cells[input_to_index(input)] = player.token
  end

end
