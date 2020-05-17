require 'pry'

class Board

  attr_accessor :cells

  @cells = []

  def reset!
    self.cells = Array.new(9, " ")
  end


  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts " "
  end

  def position(user_input)
    self.cells[user_input.to_i-1]
  end

  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.count("X") + self.cells.count("O")
  end

  def taken?(index)
    !(self.cells[index.to_i-1].nil? || self.cells[index.to_i-1] == " ")
  end

  def valid_move?(index)
  #  binding.pry
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(index, player)
    self.cells[index.to_i-1] = player.token
  end
end
