require 'pry'
class Board
attr_accessor :game, :board, :cells

def initialize
  @cells = Array.new(9, " ")
  # @board = @cells
end

def cells=(board)
  @cells = board
end
def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  # binding.pry
end

def cells
@cells
end

def reset!
  @cells = Array.new(9, " ")
end

end
