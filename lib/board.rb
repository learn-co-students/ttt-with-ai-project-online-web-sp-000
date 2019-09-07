class Board
  attr_accessor :cells

  @cells = []

  def reset!
    self.cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(user_input)
    self.cells[user_input.to_i-1]
  end

  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(position)
    self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O"
  end

  def valid_move?(user_input)
    user_input.to_i > 0 && user_input.to_i <= 9 && !taken?(user_input)
  end

  def update(position, player)
    self.cells[position.to_i-1] = player.token
  end
end
