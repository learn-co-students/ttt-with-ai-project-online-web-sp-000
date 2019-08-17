class Board
  attr_accessor :cells
  
  def initialize
    #initialize sets the cells of the board to a 9 element array of " "
    self.reset!
  end
  
  def reset!
    #reset! can reset the state of the cells in the board
    #reset! sets the cells of the board to a 9 element array of " "
    self.cells = Array.new(9, " ")
  end
  
  def display
    #display prints the board
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position (input)
    #position takes in user input and returns the value of the board cell
    self.cells[input.to_i - 1]
  end
  
  def full?
    #full? returns true for a full board
    #full? returns false for an in-progress game
    return false if self.cells.include?(" ")
    true
  end
  
  def turn_count
    #turn_count returns the amount of turns based on cell value
    count = 0
    self.cells.each {|cell| count += 1 if cell != " "}
    count
  end
  
  def taken? (position)
    #taken? returns true if the position is X or O
    #taken? returns false if the position is empty or blank
    return true if self.cells[position.to_i - 1] == "X" || self.cells[position.to_i - 1] == "O"
    false
  end
  
  def valid_move?(position)
    #valid_move? returns true for user input between 1-9 that is not taken
    return true if !taken?(position) && (1..9).include?(position.to_i)
    false
  end
  
  def update (position, player)
    #update updates the cells in the board with the player token according to the input
    self.cells[position.to_i - 1] = player.token
  end
  
end