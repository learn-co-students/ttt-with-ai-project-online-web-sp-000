require "pry"
class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    return @cells[input.to_i - 1]
  end

  def full?
    if @cells.all?{|i| i == "X" || i == "O"}
      return true
    end
  end

  def turn_count
    @cells.count{|marker| marker == "X" || marker == "O"}
  end

  def taken?(input)
    if  self.position(input) == "X" || self.position(input) == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(input)
    if input.to_i.between?(1, 9) && self.taken?(input) == false
      return true
    else
      return false
    end
  end

  def update(input, player)
      @cells[input.to_i - 1] = player.token
  end
end
