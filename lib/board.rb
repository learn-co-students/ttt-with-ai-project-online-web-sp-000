class Board

  attr_accessor :cells

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

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def position(input)
    if input.to_i >= 1 && input.to_i <= 9
      @cells[input.to_i - 1]
    end
  end

  def full?
    @cells.all? do |xo|
      xo == "X" || xo == "O"
    end
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

  def taken?(input)
    @cells[input.to_i - 1] != " "
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def turn_count
    counter = 0
    @cells.each do |turn|
      if turn == "O" || turn == "X"
        counter += 1
      end
    end
  return counter
  end

end
