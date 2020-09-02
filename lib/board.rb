
require 'pry'

class Board
  attr_accessor :cells

  def cells
    @cells
  end

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def position(user_input)
    index = user_input.to_i - 1
    @cells[index]
  end

  def update(user_input, player)
    index = user_input.to_i - 1
    @cells[index] = player.token
  end

  def token
    if self.turn_count.odd?
      return "X"
    else
      return "O"
    end
  end

  def full?
    if @cells.include?(" ")
      return false
    else
      return true
    end
  end

  def turn_count
    turn_count = 0
    @cells.each do |cell|
      if cell == "O" or cell == "X"
        turn_count += 1
      else
      end
    end
    turn_count
  end

  def taken?(position)
    index = position.to_i - 1
    if @cells[index] == "O" || @cells[index] == "X"
      return true
    else
      return false
    end
  end

  def valid_move?(position)
    if position.to_i.between?(1,9) && taken?(position) == false
      return true
    else
      return false
    end
  end

end
