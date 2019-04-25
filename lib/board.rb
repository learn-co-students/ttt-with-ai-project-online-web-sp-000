class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def position(input)
    @cells.fetch(input.to_i - 1)
  end

  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    @cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if (1..9).member?(input.to_i) && taken?(input) == false
      true
    else
      false
    end
  end

  def update(input, player)
    if valid_move?(input.to_i)
      @cells[input.to_i - 1] = player.token
    end
  end

end
