require 'pry'

class Board

  attr_accessor :cells # The 'cells' attribute represents the spots on our board.

  def initialize # We call our 'reset!' method when creating a new board.
    reset!
  end

  def reset! # We take our 'cells' attribute and set it equal to an array with 9 empty positions.
    @cells = Array.new(9, " ")
  end

  def display # We display our board by using our '@cell' attribute.
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
	  puts "-----------"
	  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
	  puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(value) # Takes the inputed user number, subtracts 1, and returns the value from that position in the array.
    @cells[value.to_i-1]
  end

  def full? # Checks to see if all values in our array are "X" or "O". If they all are, returns 'true', else 'false'.
    @cells.all? {|value| value == "X" || value == "O"}
  end

  def turn_count
    @cells.count {|value| value == "X" || value == "O"}
  end

  def taken?(value)
    @cells[value.to_i-1] == "X" || @cells[value.to_i-1] == "O" ? true : false
  end

  def valid_move?(value)
    @cells[value.to_i-1] != "X" && @cells[value.to_i-1] != "O" && value.to_i.between?(1,9) ? true : false
  end

  def update(input, player)
    position = input.to_i-1
    @cells[position] = player.token
  end

end
