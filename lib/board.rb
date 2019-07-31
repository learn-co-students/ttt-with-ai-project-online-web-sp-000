require 'pry'
class Board
attr_accessor :game, :board, :cells

def initialize
  @cells = Array.new(9, " ")
  # @board = @cells
end

def cells=(position)
  @cells = position
end
def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  # binding.pry
end
def position(input)
  position = input.to_i - 1
  @cells[position]
end
def full?
  @cells.all? do |space|
    space == "X" || space == "O"
  end
end
def turn_count
  @count = 0
  @cells.each do |space|
    if space == "X" || space == "O"
      @count += 1
    end
  end
  @count
end

def taken?(input)
  self.position(input) == "X" || self.position(input) == "O"
end

def valid_move?(input)
  !taken?(input) && (input.to_i - 1).between?(0, 8)
end

def update(input, player)
  @cells[input.to_i - 1] = player.token
  # binding.pry

end

def cells
@cells
end

def reset!
  @cells = Array.new(9, " ")
end

end
