require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position_number)
    #potential use of .tap here, but not sure how it works
    x = position_number.to_i - 1
    @cells[x]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    cells.count { |i| i == "X" || i == "O" }
  end

  def taken?(index)
    position(index) == "X" || position(index) == "O"
  end

  def valid_move?(index)
    !taken?(index) && index.to_i.between?(1,9)
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end

end
