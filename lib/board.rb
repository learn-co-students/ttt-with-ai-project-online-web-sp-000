require 'pry'
class Board
  attr_accessor :cells
  
  #start of class
  def initialize
    @cells =  [" "," "," "," "," "," "," "," "," "]
  end
  
  #reset cells
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  #display method
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  #position of player
  def position(input)
    index = input.to_i - 1
    if index.between?(0,8)
      @cells[index]
    else 
      nil 
    end
  end
  
  #board full?
  def full?
    @cells.all? do |value|
    value == "X" || value == "O"
    end
  end
  
  #turn #
  def turn_count
    counter = 0 
    @cells.each {|value|
      if value != " "
      counter += 1
      end}
    return counter
  end
  
  #is it taken  
  def taken?(input)
    if position(input) == "X" || position(input) == "O"
    true 
    else
    false
    end
  end
  #is it valid
   def valid_move?(input)
    if taken?(input) == false && input.to_i.between?(1,9)
    true
    else
    false
    end
   end
   
   #update cells
   def update(input, player)
     if valid_move?(input) == true
       index = input.to_i - 1
        @cells[index] = player.token
     end
   end

  
end
