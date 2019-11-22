class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def turn_count
    @cells.select {|ele| ele == "X" || ele == "O"}.count
  end

  def full?
    turn_count == 9
  end

  def taken?(position)
    @cells[position.to_i - 1] != " "
  end

  def valid_move?(position)
    taken?(position) == false && (position.to_i - 1).between?(0, 8)
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end

end
