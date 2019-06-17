require 'pry'
class Board
  attr_accessor :cells
  @@cells = []
  def initialize
    #@cells = [" " ," " ," " ," " ," " ," " ," " ," " ," "]
    self.cells = Array.new(9, " ")
  end
  def reset!
    # can reset the state of the cells in the board
    self.cells = Array.new(9, " ")
  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  def position(user_input)
    self.cells[user_input.to_i - 1]
  end
  def full?
    # returns true for a full board
    # returns false for in-progress game
    self.cells.all?{|cell| cell == "X" || cell == "O" }
  end
  def turn_count
    # returns the amount of turns based on cell value
    self.cells.count("X") + self.cells.count("O")
  end
  def taken?(position)
    # returns true if the position is X or O
    # returns false if the position is empty or blank
    #self.cell.each{ |position| position == "X" || position =="O" }
    self.cells[position.to_i - 1] == "X" || self.cells[position.to_i - 1] == "O"
  end
  def valid_move?(position)
    # returns true for user input between 1 - 9 that is not taken
    #move = position.to_i - 1
    !taken?(position.to_i) && position.to_i > 0 && position.to_i <= 9
  end
  def update(input, player)
    # updates the cells in the board with the player token according to the input
    move = input.to_i - 1
    self.cells[move] = player.token
  end
end

#binding.pry
