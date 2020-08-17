require 'pry'

# represents the data and logic of a Tic-tac-toe game board

class Board

  attr_accessor :cells
  
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  def initialize
    reset!
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

  # USE position(input) METHOD FOR ALL METHODS NEEDING INDEX
  def position(input)
    @cells[input.to_i - 1]
  end

  # This method will take two arguments, the first will be the position the user 
  # wants to occupy in the form of 1-9 strings that you will need to convert to 
  # the board cells' array index, along with the player object making the move. 
  # When you update the appropriate index in the cells, you will set it equal 
  # to the token of the player object by calling the #token method on the player.
  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

  def full?
    @cells.none?{|index| index == " " || index == nil}
  end

  def turn_count
    counter = 0
    @cells.each do |player|
      if player == "X" || player == "O"
        counter += 1
      end  
    end  
    counter
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    (input.to_i).between?(1,9) && !taken?(input)
  end

end