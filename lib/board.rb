#  require 'pry'

class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

 # binding.pry

  def position(position)
    index = position.to_i - 1
    @cells[index]
  end

  def update(position, player)
    index = position.to_i - 1
    @cells[index] = player.token
  end

  def full?
    @cells.all? { |t| t == "X" || t == "O" }
  end

  def turn_count
    @cells.count("X") + @cells.count("O")
  end

 # binding.pry

  def taken?(position)
    index = position.to_i - 1
    if @cells[index] != " "
      true
    else
      false
    end
  end

  def valid_move?(position)
    !taken?(position) && position.to_i > 0 && position.to_i <= 9
  end

end
