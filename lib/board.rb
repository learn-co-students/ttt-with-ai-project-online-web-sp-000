class Board
  attr_accessor :cells

  def reset!
    @cells = [" ", " ", " ", " ", " ", " " , " ", " ", " "]
  end

  def initialize
    @cells = [" ", " ", " ", " ", " ", " " , " ", " ", " "]
  end

  def display
    puts  " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts  "-----------"
    puts  " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts  "-----------"
    puts  " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    x = self.cells.count("X")
    o = self.cells.count("O")
    turns = x + o
  end

  def taken?(input)
    self.position(input).include?("X") || self.position(input).include?("O")
  end

  def valid_move?(input)
    if input.to_s.to_i.between?(1,9)
      !taken?(input)
    else
      false
    end
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end
end
