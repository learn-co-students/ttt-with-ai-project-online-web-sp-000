require "pry"

class Board
  attr_accessor :cells

  @cells = []
  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
      print " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      print "-----------"
      print " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      print "-----------"
      print " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    index = user_input.to_i - 1
    cells[index]
  end

  def full?
    cells.all? { |x| x == " "? false : true }
  end

  def turn_count
    cells.count { |x| x == "X" || x == "O"}
  end

  def taken?(user_input)
    position(user_input) == "X" || position(user_input) == "O"
  end

  def valid_move?(user_input)
    index = user_input.to_i - 1
    if index.between?(0,8) && position(user_input) == " "
      true
    end
  end

  def update(user_input, player)
    index = user_input.to_i - 1
    cells[index] = player.token
  end
end
