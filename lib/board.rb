require 'pry'

class Board
  attr_accessor :cells

  def reset!
    self.cells.clear
    self.cells=Array.new(9," ")
  end

  def initialize
    self.cells=Array.new(9," ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i-1]
  end

def full?
  self.cells.all?{|index| index=="X" || index=="O"}
end

def turn_count
  self.cells.count{|index| index=="X" || index=="O"}
end

def taken?(input)
  if cells[input.to_i-1].include?("X") || cells[input.to_i-1].include?("O")
    true
  else cells[input.to_i-1].include?(" ")
    false
  end
end

def valid_move?(input)
  if input.to_i-1>=0 && input.to_i-1<=9 && cells[input.to_i-1].include?(" ")
    true
  end
end

def update(input, user)
  self.cells[input.to_i-1]=user.token
end

end


#def update(input,token)
#cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#player=input-1
#cells.insert(player, token)
#end

#update(4,"O")
