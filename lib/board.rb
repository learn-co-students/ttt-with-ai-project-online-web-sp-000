class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def cells
    @cells
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

  def position(n)
    input_to_index(n)
  end

  def update(new_position, player)
    @cells[new_position.to_i - 1] = player.token
  end

  def turn_count
    9 - @cells.count(" ")
  end

  def full?
    @cells.all? { |cell| cell != " " }
  end

  def taken?(position)
    (input_to_index(position) == "O" || input_to_index(position) == "X") ? true : false
  end

  def valid_move?(input)
    input.match?(/[1-9]/) ? !taken?(input) : false
  end

  def input_to_index(n)
    @cells[n.to_i - 1]
  end

end
