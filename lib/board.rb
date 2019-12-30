## Objectives
# 1. Build a command-line interface (CLI).
# 2. Create a domain model with multiple relating and collaborating objects.

class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    # resets the state of the cells in the board = (new array, 9 cells)
    @cells = Array.new(9, " ")
  end

  def display
    # prints the board
    # expect(output).to include(" X | X | X ")
    # expect(output).to include("-----------")
    # expect(output).to include(" X | O | O ")
    # expect(output).to include("-----------")
    # expect(output).to include(" X | O | O ")
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(token)
    # takes in user input and returns the value of the board cell
    @cells[token] 
  end

end
