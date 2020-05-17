require 'pry'
class Board
  attr_accessor :cells

  @cells = []

  def reset!
    self.cells.clear
    self.cells = Array.new(9, " ")
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    cell = input.to_i - 1
    self.cells[cell]
  end

  def full?
    self.cells.all? do |slot|
      slot != " "
    end  #true if board is full
  end

  def turn_count
    count = 0
    self.cells.each do |slot|
      if slot != ' '
        count += 1
      end
    end
    count
  end

  def taken?(input) #true if X or O
    cell = input.to_i - 1
    self.cells[cell] == "X" || self.cells[cell] == "O"
  end

  def valid_move?(input)
    if input == "invalid"
      false
    elsif not self.taken?(input)
      true
    end
  end

  def update(input, player)
    cell = input.to_i - 1
    self.cells[cell] = player.token
  end


end
