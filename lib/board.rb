class Board
  attr_accessor :cells

  def initialize
    @cells = cells
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts " #{cells[7]} | #{cells[8]} | #{cells[9]} "
  end

  def position(input)
    input = gets.chomp.to_i
    if @cells[input - 1] == " " ? true : false
    end
  end

  def update (position, object)
    @cells[index - 1] = object if position == true
  end



end
