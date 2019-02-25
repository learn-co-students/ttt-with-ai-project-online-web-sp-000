require "pry"

class Board
  attr_accessor :cells
  
  def initialize
    reset!
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
  end
  
  def position(user_input)
    @cells[user_input.to_i - 1]
  end
  
  def full?
   !self.cells.include?(" ")
  end
  
  def turn_count
    @cells.length - @cells.count(" ")
  end
  
  def taken?(user_input)
    if @cells[user_input.to_i - 1] == "X" || @cells[user_input.to_i - 1] == "O"
      return true
    elsif @cells[user_input.to_i - 1] == " " || @cells[user_input.to_i - 1] == nil
      return false
    end
  end
  
  def valid_move?(user_input)
    if !taken?(user_input) && (user_input.to_i > 0 && user_input.to_i < 10)
      return true
    end
  end
  
  def update(user_input, player)
    if valid_move?(user_input)
      @cells[user_input.to_i - 1] = player.token
    end
  end
  
end