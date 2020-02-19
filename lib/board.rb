require 'pry'
class Board
  attr_accessor :cells
  
  def initialize(board=nil)
    @cells = []
    reset!
    #call reset method to ensure board is blank
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    #sets all cells to blank
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    #prints out current state of board
  end
  
  def position(input)
    #takes in the user's input and looks up the value of the cells 
    #converts users input to correct by aray ie (-1)
    @cells[input.to_i-1]
  end
  
  def update(input, player)
    if valid_move?(input)
    #find token Value from player number/name
      token = self.current_player
    #update board with move whilst converting input to index
      @cells[input.to_i-1] = token
    end
  end
  
   
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def taken?(index)
   !(position(index) == " ")
  end
  
  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end
  
  def full?
  @cells.each {|a| return false if a == " "}
  end
  
  def valid_move?(index)
    !taken?(index) && index.to_i >0 && index.to_i <=9
  end
  
  

end