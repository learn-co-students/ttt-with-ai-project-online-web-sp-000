require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = cells
    reset!
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
    cell = input.to_i - 1
    self.cells[cell]
  end

  def update (position, object)
    object = player.token
    position = object if !self.taken?
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    @cells.count {|v| v == "X" || v == "O"}
  end

  def taken?(input)
    position(input) != " " ? true : false
  end

  def valid_move?(input)
    index = input.to_i - 1
    index.to_i.between?(0,8) && !taken?(input)
 end

 def update (input, player)
   index = input.to_i - 1
   @cells[index] = player.token
 end
end
