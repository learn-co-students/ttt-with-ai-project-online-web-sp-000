class Board
  
  attr_accessor :cells
  
  def initialize
    
   reset!
    
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
  
    @cells[(input.to_i) - 1]
  
  end
  
  def update(input, player)
    
    if (valid_move?(input))
      @cells[(input.to_i) - 1] = player.token
      return true
    else
      return false
    end
    
  end
  
  def full?
    
    @cells.select{|token|token == "X" || token == "O"}.length == 9 ? true : false
    
  end
  
  def taken?(input)
    
    position(input) == " "? false : true
    
  end
  
  def valid_move?(input)
    
    !(taken?(input)) && input.to_i.between?(1,9) ? true : false
    
  end
  
  def turn_count
    
    @cells.count{|token| token == "X" || token == "O"}
    
  end
  
end