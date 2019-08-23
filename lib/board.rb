require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " "," ", " "," ", " "," ", " ", " "]
    reset!
  end

  def empty?
    cells == [" ", " "," ", " "," ", " "," ", " ", " "]
  end

  def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    @cells = [" ", " "," ", " "," ", " "," ", " ", " "]
  end

  def position(location)
    location = location.to_i - 1
    @cells[location]
  end


  def full?
      @cells.none? { |f| f == " " }
  end

  def turn_count
    counter = 0
    @cells.each { |location| counter +=1 if location !=" "  }
    counter
  end

  def taken?(location)
    position(location) != " "
  end

  def valid_move?(move)
    move.to_i.between?(1, 9) && !taken?(move.to_i)
  end

  def get_valid_moves
    (1..9).select { |a| valid_move?(a) }
  end

  def update(location, player)
    # binding.pry
    location = location.to_i - 1
    @cells[location] = player.token
  end

end
