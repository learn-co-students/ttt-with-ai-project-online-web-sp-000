class Board

  attr_accessor :cells

  @cells = []

  def initialize
    self.reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    row1 = " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    row2 = " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    row3 = " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    line = "-----------"

    puts row1
    puts line
    puts row2
    puts line
    puts row3
  end

  def position(input)
    i = input.to_i - 1
    @cells[i]
  end

  def full?
    @cells.none? {|el| el == "" || el == " "}
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end
