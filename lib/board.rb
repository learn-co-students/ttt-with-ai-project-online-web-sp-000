class Board

  attr_accessor :cells

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

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def position(input)
    input = input.to_i
    if input > 0 && input <= 9
      @cells[input-1]
    end
  end

  def full?
    @cells.each do |c|
      c = "X" || c = "O"
    end
  end

  def update(input, player)
    input
  end

end
