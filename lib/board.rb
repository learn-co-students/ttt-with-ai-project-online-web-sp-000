class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def cells
    @cells
  end

  def reset!
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
    @cells[input_to_index(input)]
  end

  def full?
    @cells.all? {|index| index == "X" || index == "O"}
  end

  def turn_count
    @cells.count {|index| index == "X" || index == "O"}
  end

  def taken?(input)
      @cells[input_to_index(input)] == "X" || @cells[input_to_index(input)] == "O" ? true : false
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input) ? true : false
  end

  def update(position, player)
    cells[input_to_index(position)] = player.token
  end

  def input_to_index(input)
    input.to_i - 1
  end

end
