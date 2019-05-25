require 'pry'
class Board 

  attr_accessor :cells 
  
  def initialize
   reset!  
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end 

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "  
  end 
  
  def position(user_input)
    user_input = user_input.to_i 
    user_input = cells[user_input-=1]
  end 
  
  def full?
    cells.all? {|cell| cell != " "} 
  end 

  def turn_count 
    count = 0
    
    cells.each do |cell|
      if cell != " "
        count+=1 
          end 
      end 
      count 
  end 
  
  def taken?(index)
    index = index.to_i - 1 
    !(cells[index] == " " || cells[index] == "")  
  end 
  
  def valid_move?(user_input)
    user_input = user_input.to_i 
    if user_input.between?(1,9) && !taken?(user_input) 
      true 
    end 
  end 
  
  def update(user_input, player)
    user_input = user_input.to_i - 1 
    #binding.pry 
    @cells[user_input] = player.token 
    #== token
  end 
  
end 