class Board 
  attr_accessor :cells
 
  def initialize 
    self.reset!
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

  def position(input)
    @cells[input.to_i - 1]
  end
  
  def update(input, current_player) 
    @cells[input.to_i - 1] = current_player.token
  end
  
  def full? 
    @cells.none?{|token| token == " "} 
  end
  
  def turn_count 
    @cells.count {|token| token == "X" || token == "O" }
  end
  
  def taken?(input)
    self.position(input) == " " || self.position(input) == "" || self.position(input) == nil ? false : true
  end
  
  def valid_move?(input)
    input.to_i.between?(1, 9) == true && taken?(input) == false ? true : false
  end

end 