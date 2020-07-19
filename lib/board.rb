require 'pry'
require 'set'

class Board

attr_accessor :cells, :corners, :edges, :center, :turn_count


def initialize
  @cells
  @corners = Set[1, 3, 7, 9]
  @edges = Set[2, 4, 6, 8]
  @center = 5
  @turn_count = 0
  reset!
end

def reset!
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def display
  puts " "
  puts "Round #{turn_count}:"
  puts "-----------"
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  puts "-----------"
  puts " "
end

def position(input)
  return @cells[input.to_i - 1]
end

def full?
  return !(@cells.any?{|i| (i == " ") || (i == "")})
end

def turn_count
 # count = 0
 # @cells.each_index{|index| taken?((index + 1).to_s) ? count += 1 : false}
 # return count
 return @turn_count
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
  if (1..9).include?(input.to_i) && !taken?(input)
      return true
  else
      return false
  end
end

def update(input, player)
 index = input.to_i - 1
 @cells[index] = player.token
 display
 @turn_count += 1
end

end
