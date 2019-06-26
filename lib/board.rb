require 'pry'

class Board
  attr_accessor :cells
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    reset!
  end
  
  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    if cells.detect {|cell| cell == " "}
      false
    else
      true
    end
  end
  
  def turn_count
    cells.count("O") + cells.count("X")
  end
  
  def taken?(input)
    if position(input) != " "
      true
    else
      false
    end
  end
  
  def valid_move?(input)
    pos = input.to_i
    if pos >= 1 && pos <= 9 && !taken?(input)
      true
    else
      false
    end
  end
  
  def update(pos, player)
    cells[pos.to_i - 1] = player.token
  end
end