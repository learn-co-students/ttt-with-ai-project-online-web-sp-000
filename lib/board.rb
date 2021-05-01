require 'pry'
class Board
  
  attr_accessor :cells
  
  def reset!
    cells.clear
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end
  
  
  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    self.cells[input.to_i - 1]
  end
  
  def full?
    cells.all? do |player_token|
      player_token == "X" || player_token == "O"
    end
  end
  
  def turn_count
    self.cells.count do |cell|
      cell == "X" || cell == "O"
    end
  end
  
  def taken?(position)
    if self.cells[position.to_i - 1] == "X" || self.cells[position.to_i - 1] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(position)
    if !position.to_i.between?(1,9)
      false
    elsif !taken?(position)
      true
    end
  end
  
  def update(position, player)
    # binding.pry
    self.cells[position.to_i - 1] = "#{player.token}"
    
  end
  
end