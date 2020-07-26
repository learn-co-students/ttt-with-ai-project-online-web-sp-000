class Board

  attr_accessor :cells

  def initialize
    reset!
  end

# ! does not really matter, here, it is just a way to say that we force something.
# This is to indicate to other developers that we are forcing something to happen.
# Here it is forcing the cells array to reset.
  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

# a ? at the end of the method name is an indication that the method will return 'true' or 'false'
  def full?
    cells.all?{|c| c == "X" || c == "O"}
  end

  def turn_count
    cells.count{|c| c == "X" || c == "O"}
  end

  def taken?(input)
    cells[input.to_i - 1] == "X" || cells[input.to_i - 1] == "O" ? true : false
  end

  def valid_move?(input)
    taken?(input) == false && input.to_i.between?(1, 9) ? true : false
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token if valid_move?(input)
  end

end
