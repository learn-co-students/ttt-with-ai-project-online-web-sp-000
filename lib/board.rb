require 'pry'

class Board
  
  attr_accessor :cells
  
  def initialize
    @cells = [" "," ", " "," "," "," "," "," "," "]
  end
  
  def reset!
    @cells.clear
    @cells = [" "," ", " "," "," "," "," "," "," "]
  end
    
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end
   
  def position(input)
    input = input.to_i - 1
    @cells[input]
  end
  
  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end
  
  def turn_count
    @cells.count{ |c| c == "O" || c == "X"}
  end
  
  def taken?(input)
    if self.position(input) == " "
      false
    else
      true
    end
  end
  
  def valid_move?(input)
    input = input.to_i
    if input == 0
      false
    elsif input > 10 
      false
    elsif full?
      false
    elsif taken?(input)
      false
    else
      true
    end
  end
  
  def update(position, player)
    if player.token == "X" || player.token == "O"
      if valid_move?(position)
        index = position.to_i - 1
        @cells[index] = player.token
      else
        nil
      end
    end
  end
  
end