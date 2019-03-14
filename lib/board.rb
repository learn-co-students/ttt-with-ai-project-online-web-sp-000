require "pry"
class Board
  attr_accessor :cells

def initialize
  @cells = Array.new(9, " ")
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
  index = (input.to_i - 1)
  @cells[index]
end

def full?
@cells.include?(" " || "" || nil) ? false : true
end

def turn_count
  x_turns = @cells.count("X")
  o_turns = @cells.count("O")
  turn_count = x_turns + o_turns
  return turn_count
end

def taken?(input)
  if position(input) == "X"
    true
  elsif position(input) == "O"
    true
  else
    false
  end
end

def valid_move?(input)
  if (input.to_i.between?(1,9) == true) && (taken?(input.to_i) == false)
    return true
  else
    return false
  end
end

def update(position, player)
index = (position.to_i - 1)
@cells[index] = player.token
end


end
