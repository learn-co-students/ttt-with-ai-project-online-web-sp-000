require 'pry'
class Board 
  attr_accessor :cells 
  
  def initialize
    self.reset!
  end 
  
  def reset!
    @cells = Array.new(9, " ") 
  end 
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    @cells[input.to_i - 1]
  end 
  
  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end 
  
  def full?
    if @cells.include?(" ")
      false 
    else
      true 
    end 
  end 
  
  def turn_count
    counter = 0
    @cells.each do |position| 
      if position == "X" || position == "O"
        counter += 1 
        counter 
      end
    end
    counter 
  end 
  
  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      return true 
    else
      return false 
    end 
  end
  
  def valid_move?(input)
    if !taken?(input) && input.to_i.between?(1,9)
      return true 
    else
      return false
    end 
  end 
  
end 