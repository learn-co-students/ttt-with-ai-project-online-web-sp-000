class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    #resets the cells array to starting positions
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    #displays current game state
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    #takes user input (string, 1-9) and looks up the value of the cell at that index in the cells array. will be used by other methods.
    @cells[(input.to_i - 1)]
  end

  def update(input, player)
    #updates game state after a player makes a move; takes two arguments(desired cell and player object making the move). after update, cell value should be set to the player's token via calling the token method on the player.
    cells[input.to_i - 1] = player.token
  end

  def full?
    #determines if the board is full
    !@cells.include?(" ")
  end

  def turn_count
    turn_count = 0
    cells.each do |token|
      if token == "X" || token == "O"
      turn_count += 1
      end
    end
    turn_count
  end

  def taken?(input)
    #checks to see if a position is taken already; will return true or false
    !(position(input) == " " || position(input) == "")
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end
end
