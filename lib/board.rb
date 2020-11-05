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
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.all? {|i| i == "X" || i == "O"}
  end

  def turn_count
    self.cells.count("X") + self.cells.count("O")
  end

  def taken?(input)
    if position(input) == " "
      false
    else
      true
    end
  end

  def valid_move?(input)
    return true if taken?(input) == false && input.to_i.between?(1,9)
  end

  def update(input, player)
    self.cells[input.to_i-1] = player.token
  end

end
