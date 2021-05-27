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
    index = (input.to_i)-1
    @cells[index]
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
    if self.position(input) == " "
      return false
    end 
    true 
  end 
  
  def valid_move?(input)
    if input.to_i.between?(1,9) && taken?(input) == false
      return true
    end
    false
  end 
  
  def update(input, player_token)
    index = (input.to_i)-1 
    @cells[index] = player_token 
  end 
  
end 
