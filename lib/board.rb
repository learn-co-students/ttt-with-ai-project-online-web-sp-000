require 'pry'
class Board
  
  attr_accessor :cells, :token
  
  def initialize
    @cells = []
    self.reset!
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts " "
  end
  
  def position(input)
    index = input.to_i - 1
    @cells[index]
  end
  
  def update(position, player_object)
    index = position.to_i - 1
    @cells[index] = player_object.token
  end
  
  def full?
    @cells.none? {|space| space == " "}
  end
  
  def turn_count
    @cells.select {|space| space == "X" || space == "O"}.length
  end
  
  def taken?(position)
    index = position.to_i - 1
    !(@cells[index] == " ")
  end
  
  def valid_move?(position)
    if (!(self.taken?(position)) && 1 <= position.to_i && position.to_i <= 9)
      true
    else
      false
    end
  end
  
  def reset!
    @cells = [" ", " ", " " , " ", " ", " ", " ", " ", " "]
  end
end
