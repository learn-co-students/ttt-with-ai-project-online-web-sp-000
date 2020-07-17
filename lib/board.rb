require 'pry'
class Board

attr_accessor :cells


  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    # @turn_count = 0
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
    # !(self.cells.any?{|i| (i == " ") || (i == "")})
    return !(self.cells.any?{|i| (i == " ") || (i == "")})
  end

#   def turn_count
#   @cells.each { |cell|
#     # if taken?((@cells.index(cell) + 1).to_s)
#     if taken?(cell)
#       @turn_count += 1
#     end}
#   return @turn_count
# end

def taken?(input)
  contents = position(input)
  if (contents == "X") || (contents == "O")
    return true
  elsif (contents.nil?) || (contents == " ")
    return false
  end
end

def empty_positions
  # empty_positions = ((1..9).to_a - self.positions) - them.positions
  return @cells.select{ |cell| !taken?(cell) }
end

def valid_move?(input)
  if ((input.to_i >= 1) && (input.to_i <= 9)) && !taken?(input)
    # if (1..9).include?(input.to_i) && !taken?(input)
      return true
  else
      return false
  end
end


def update(input, player)
  input = input.to_i - 1
  @cells[input] = player.token
end

end
