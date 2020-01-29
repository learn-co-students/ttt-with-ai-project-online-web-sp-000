require 'pry'
class Board
  attr_accessor :cells

  def initialize()
    @cells = cells
   reset!
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.any?{|index| index == " "} ? false : true
  end

  def turn_count
    cells.count{ |cell| cell == "X" || cell == "O" }
  end

  def taken?(position)
    cells[position.to_i - 1] != " " && cells[position.to_i - 1] != ""
  end

  def valid_move?(location)
    position = location.to_i
    position.between?(1,9) && !taken?(position)
  end

  def update(position, player)
    cells[position.to_i-1] = player.token
  end

end
