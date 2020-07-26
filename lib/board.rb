require "pry"

class Board
  attr_accessor :cells

  def initialize
   @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def reset!
    @cells.clear
    @cells = [" "," "," "," "," "," "," "," "," "]
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
    @cells.none? {|i| i == " " }
  end
  
  def turn_count
    counter = 0
    @cells.each do |turn|
    if turn == "X" || turn == "O"
     counter += 1
     end
    end
   return counter      
  end
  
  def taken?(user_input)
    @cells[user_input.to_i - 1] != " " && @cells[user_input.to_i - 1] != ""
  end
  
  def valid_move?(user_input)
    index = user_input.to_i - 1
    index.between?(0,8) && !taken?(user_input)
  end
  
  def update(user_input,current_player)
    if valid_move?(user_input)
      @cells[user_input.to_i - 1] = current_player.token
    end
  end
end


