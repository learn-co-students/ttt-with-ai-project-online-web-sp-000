class Board 
  attr_accessor :cells
  
  def initialize
    @cells = []
    self.reset!
    
  end 
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end 
  
  def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  def position(input)
    nmbr = input.to_i 
    @cells[nmbr - 1]
  end
  
  def update(input, player)
    if self.position(input) == " "
      @cells[input.to_i - 1] = "#{player.token}"
  end
end 
  
  def full?
    if @cells.include?(" ")
      false 
    else 
      true 
  end
end 

  def turn_count
     turns = @cells.select {|spot| spot != " "}
     turns.count 
  end
  
  def taken?(input)
    if self.position(input) != " "
      true 
    else 
      false 
    end
  end

  def valid_move?(input)
    if input.to_i.between?(1,9) && self.position(input) == " "
      true 
    else
      false 
    end
  end
  
  
end