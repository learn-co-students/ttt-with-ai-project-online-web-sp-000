class Board
  attr_accessor :cells

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
   end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    input = input.to_i
    @cells[input-1]
  end

  def taken?(input)
    position(input) == "O" || position(input) == "X"
  end

  def valid_move?(input)
    input = input.to_i
    !(taken?(input)) && input.between?(1,9)
  end

  def turn_count
    counter=0
    @cells.each do |spaces|
      if spaces == "X" || spaces == "O"
      counter +=1
    end
    end
    counter
  end

  def full?
    @cells.all? {|i| i == "X" || i == "O"}
  end

  def update(input, player)
    input = input.to_i
    @cells[input-1] = player.token
    display
  end

end
