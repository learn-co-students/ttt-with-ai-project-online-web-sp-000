require "pry"
class Board
  attr_accessor :cells 
  
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
    puts "-----------"
  end 
  
  def position(input)
    @cells[(input.to_i)-1]
  end 
  
  def full?
    status = false 
    if @cells.all? {|index| index == "X" || index == "O"}
      status = true 
    end
    status
  end 
  
  def turn_count
    @cells.count("X") + @cells.count("O")
  end 
  
  def taken?(input)
    status = false
    if self.position(input) == "X" || self.position(input) == "O"
      status = true
    end 
    status 
  end 
  
  def valid_move?(input)
    status = false
    if input.to_i.between?(1,9) && taken?(input) == false
      status = true 
    end
    status
  end 
  
  def update(input, player)
    @cells[(input.to_i)-1] = player.token 
  end 
  
end 
