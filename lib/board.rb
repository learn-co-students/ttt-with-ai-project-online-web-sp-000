class Board 
  attr_accessor :cells
  
  def initialize
    @cells = cells || Array.new(9, " ") 
  end 
  
  def reset! 
    @cells.fill(" ", 0..8)
  end 
  
  def display 
   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
   puts "-----------"
   puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
   puts "-----------"
   puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    input_to_index = input.to_i - 1 
    return @cells[input_to_index]
  end 
  
  def full?
    @cells.all? do |check| 
      check == "X" || check == "O"
     
    end       
  end 
  
  def turn_count
    count_turns = 0 
    @cells.each do |check| 
      if check == "O" || check == "X" 
        count_turns = count_turns + 1 
      end 
    end 
    return count_turns
  end 
  
  def taken?(input)
    input_to_index = input.to_i - 1 
    if @cells[input_to_index] == "X" || @cells[input_to_index] == "O" 
      return true 
    else 
      return false 
    end 
  end 
  
  def valid_move?(input)
    input_to_index = input.to_i - 1
    if input_to_index.between?(0,8) && !taken?(input) 
      return true 
    else 
      return false 
    end 
  end 
  
  def update(input, player)  
    input_to_index = input.to_i - 1
    @cells[input_to_index] = player.token
  end 




end 