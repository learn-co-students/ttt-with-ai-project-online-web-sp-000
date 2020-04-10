class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    cells[index]
  end

  def full?
    cells.all? { |cell| cell == "X" || cell == "O" }
  end

  def turn_count
    filled_cells = cells.select { |cell| cell == "X" || cell == "O" }
    filled_cells.length
  end

  def taken?(input)
    index = input.to_i - 1
    cells[index] == "X" || cells[index] == "O"
  end

  def valid_move?(input)
    index = input.to_i - 1
    !taken?(input) && index.between?(0, 8)
  end

  def update(input, player)
    index = input.to_i - 1
    cells[index] = player.token
  end

end
