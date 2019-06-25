require 'pry'
class Board
  attr_accessor :cells

@cells = []

def reset!
  @cells = [" "," "," "," "," "," "," "," "," "]
end

def initialize
  self.reset!
end

def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

def position(user_input_string)
  index = user_input_string.to_i - 1
  @cells[index]
end

def full?
  !@cells.include?(" ")
end

def turn_count
  counter = @cells.select {|value| value unless value == " "}
  # binding.pry
  counter.size
end

def taken?(input)
  position(input) != " "
end

def valid_move?(input)
  !taken?(input) && input.to_i.between?(1,9)
end

def update(input,player)
  index = input.to_i - 1
  # binding.pry
  @cells[index] = player.token
end



end
