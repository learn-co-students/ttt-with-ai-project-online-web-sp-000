require 'pry'
class Board
  attr_accessor :cells
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    index = input.to_i
    index -= 1
    self.cells[index]
  end

  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    index = input.to_i
    index -= 1
    self.cells[index] == "X" || self.cells[index] == "O" ? true : false
  end

  def valid_move?(input)
    index = input.to_i
    index -= 1
    if index.between?(0, 8)
       self.cells[index] == " " ? true : false
    else
      false
    end
  end

  def update(input, player)
    index = input.to_i
    index -= 1
    self.cells[index] = player.token
  end
end
