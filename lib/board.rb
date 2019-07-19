class Board
  attr_accessor :cells                                    #cells attribute to store all cells on board

  def initialize
    return reset!                                          #calls #reset! sets the board to an empty array upon initialization
  end

  def reset!                                               #resets! the state of the cells in the board
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ", ]    #sets the cells of the board to 9 element array of empty strings
  end

  def display                                              #prints the board
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    input = input.to_i          #converts our input to integer
    return @cells[input - 1]    #returns (input - 1) for element conversion purposes
  end

  #none? Passes each element of the collection to the given block, returns true if the block never returns true for all elements.
  def full?
    cells.none? {|cell| cell == " " || cell == nil}
  end

  #count method returns number of elements when block returns to be true. We set block to "X" || "O"
  #returns the amount of turns based on cell value
  def turn_count
    cells.count {|cell| cell == "X" || cell == "O"}
  end

  #calls to position method. sets a condition
  #returns t/f if position is X/O or empty black
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  #returns true for user input between 1-9 not taken
  def valid_move?(input)
    input = input.to_i
    !(taken?(input)) && input.between?(1, 9)    #move valid if only {not (!) taken && between 1-9}
  end

  #updates cells in board with player token according to input
  def update(input, player)
    input = input.to_i
    cells[input - 1] = player.token           #calls to players token attribute in Player class
  end
end
