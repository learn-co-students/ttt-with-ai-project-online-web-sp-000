class Board 
  attr_accessor :cells 
  
  def initialize
    @cells = Array.new(9, " ") 
  end 
  
  def reset!
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '] 
  end 
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  def input_to_index(input)
    int = input.to_i - 1
  end 
  
  def position(input)
    index = input_to_index(input) 
    @cells[index]
  end
    
  def full?
    @cells.include?(' ') ? false:true 
  end 
  
  def turn_count
    counter = 0 
    @cells.each do |cell|
      if cell != ' '
        counter += 1 
      end 
    end 
    counter 
  end 
  
  def taken?(input)
    position(input) != ' ' ? true:false
  end 
  
  def valid_move?(input)
    if (0..9) === input_to_index(input) 
      taken?(input) ? false:true
    else 
      false
    end 
  end 
  
  def update(input, player)
    if valid_move?(input)
      index = input_to_index(input)
      @cells[index] = player.token
    end 
  end 
  
end 
