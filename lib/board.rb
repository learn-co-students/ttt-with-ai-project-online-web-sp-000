require "pry"

class Board
  attr_accessor :cells

  def initialize
    reset!
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
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    if !@cells.detect {|cell| cell == " " || cell == nil}
      true
    else
      false
    end
  end

  def turn_count
    @cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if input.to_i.between?(1,9) && !taken?(input)
      true
    else
      false
    end
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
    display
  end

end
