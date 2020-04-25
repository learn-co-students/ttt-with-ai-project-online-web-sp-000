require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def position(input)
    @cells[input_to_index(input)]
  end

  def full?
    return_value = true
    @cells.each do |index|
      if (index.nil? || index == " ")
        return_value = false
      end
    end
    return_value
  end

  def turn_count
    counter = 0
    @cells.each do |index|
      if !(index.nil? || index == " ")
        counter += 1
      end
    end
    counter
  end

  def taken?(index)
    !(@cells[index.to_i-1].nil? || @cells[index.to_i-1] == " ")
  end

  def valid_move?(input)
    index = input_to_index(input)
    if ( index.between?(0,8) && taken?(index+1) == false)
      return true
    end
  end

  def update(input,player)
    index = input_to_index(input)
    @cells[index.to_i] = player.token
   end
end
