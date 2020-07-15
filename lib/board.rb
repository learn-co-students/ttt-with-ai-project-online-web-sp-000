require 'pry'
class Board

attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def cells
    return @cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    position = input.to_i - 1
    return @cells[position]
  end

  def full?
    return @cells.none? {|i| (i == " ") || (i == "")}
  end

  def turn_count
  count = 0
  @cells.each { |cell|
    if (cell == "X") || (cell == "O")
      count += 1
    end}
  return count
end

def taken?(input)
  contents = position(input)
  if (contents == "X") || (contents == "O")
    return true
  elsif (contents.nil?) || (contents == " ")
    return false
  end
end

def valid_move?(input)
  binding.pry
  if input.between?(1, 9) && !taken?(input)
    return true
  else
    return false
  end
end

def update(input, player)
  @cells[input.to_i - 1] = player.token
end

end
