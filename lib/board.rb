class Board
attr_accessor :cells
  def initialize

  self.reset!
  end

  def reset!
@cells = Array.new(9, " ")
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
  puts ""
  puts ""
end

def position(num)
cells[num.to_i - 1]
end

def full?
  @cells.none?  {|i| i == " " || i == ""}
end

def turn_count
  counter = 0
  @cells.each do |space|
  if space != " "
      counter += 1
    end
  end
  return counter
end

def i_to_i(str)
str.to_i - 1
end

def taken?(input)
  location = i_to_i(input)
 @cells[location] != " " && @cells[location] != ""
end

def valid_move?(input)
  index = i_to_i(input)
  index.between?(0,8) && !taken?(input)
end

def update (move, player)
index = i_to_i(move)
@cells[index] = player.token
end



end
