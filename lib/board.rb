class Board #Name of class
attr_accessor :cells #attribute of the class, this can be read and edited 

@cells = [] #varaible so we can store data in the cells attribute 


  def initialize #when board is called it will be started with an empty 9 long " " array 
    @cells = Array.new(9, " ") #easier way to have a space of 9 
  end


  def reset!  # to clear the board and have another 9 array for the board 
    @cells.clear
    @cells = Array.new(9, " ")
  end


  def display
      puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
      puts "-----------"
      puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
      puts "-----------"
      puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(user_input)
    self.cells[user_input.to_i - 1]
  end

  def full? #is the game full or not? 
    if !self.cells.any?{|x| x == "" || x == " "} #If any cells in the the board have an empty space != Full (NOT FULL) 
      return true #this is true if the board is full
    else
      return false 
  end 
  end 


  def turn_count
    self.cells.count{|token| token == "X" || token == "O"} #within the board cells counts how many "X" and "O"
  end
  
def taken?(position) #is this position taken? 
  if self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O" #helper method, position.to_i-1 is basically the same thing in the orginal method above. 
    return true
  else
    return false 
  end
end 

  def valid_move?(position) #is this a valid move? 
    !taken?(position) && position.to_i >0 && position.to_i <=9
  end 
  
  def update(position, player)
    self.cells[position.to_i-1] = player.token 
  end 


end







