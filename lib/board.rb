class Board
  attr_accessor :cells
# each time the app is started the initialize method created a new board
  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

# display shows the board
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

# position takes in the players input and looks up the proper cell.
  def position(input)
    cells[input.to_i - 1]
  end

# full? method checks to see if all positions on the board are full
  def full?
    @cells.all?{|i| i != " "}
  end

# turn_count method keeps track of current turn
  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

# taken method takes input and checks if a position is taken based on if it contains a string
  def taken?(input)
    position(input) != " "
  end

# valid move takes input and checks to see if it is taken and between 1 and 9
  def valid_move?(input)
      !taken?(input) && input.to_i.between?(1,9)
  end

# update method updates the board with the players chosen cell.
  def update(input, player)
    cells[input.to_i - 1] = player.token
  end
end
