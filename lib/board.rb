class Board
  attr_accessor :cells

  def initialize
    reset!
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
    puts " "
  end

  def position(idx)
    @cells[input_to_index(idx)]
  end

  def taken?(idx)
    taken(input_to_index(idx))
  end
  def taken(idx)
    @cells[idx] != " "
  end

  def update(input, player)
    move(input_to_index(input), player.token)
  end

  def input_to_index(str)
    str.to_i - 1
  end

  def move(idx, token)
    @cells[idx] = token
  end

  def valid_move?(idx)
    i = input_to_index(idx)
    !taken(i) && i.between?(0, 8)
  end

  def turn_count
    @cells.count { |tile| tile != " "}
  end

  def full?
    @cells.detect{|x| x == " "} == nil
  end

end
