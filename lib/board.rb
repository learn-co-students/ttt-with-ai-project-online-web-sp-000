<<<<<<< HEAD

require 'pry'
class Board 
=======
class Board
>>>>>>> e364ad0a2a4ed252787dfabecfacf65dd1927822
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    input = input.to_i
    @cells[input - 1]
  end

  def full?
    if @cells.any?{|index| index == " " || index == nil}
      return false
    else
      true
    end
  end

  def turn_count
    count = 0
    @cells.each do |token|
      if token == "X" || token == "O"
        count += 1
      end
    end
    count
  end


  def taken?(index)
    index = index.to_i
    if position(index) == "X" || position(index) == "O"
      return true
    else
      false
    end
  end

  def valid_move?(input)
    input = input.to_i
    if input.between?(1, 9) && !taken?(input)
      true
    else
      false
    end
  end

  def update(input, player = "X")
    input = input.to_i
    @cells[input - 1] = player.token
  end
end
