require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = []
    reset!
  end

  def cells
    @cells
  end

  def reset!
    count = 0
    while count < 9
      @cells[count] = " "
      count += 1
    end
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    cells.all? {|x| x == "X" || x == "O"}
  end

  def turn_count
    cells.count {|x| x == "X" || x == "O"}
  end

  def taken?(position)
    cells[position.to_i - 1] == "X" || cells[position.to_i - 1] == "O"
  end

  def valid_move?(position)
    #binding.pry
    (not taken?(position)) && (position.to_i >= 1 && position.to_i <= 9)
  end

  def update(position, player)
    cells[position.to_i - 1] = player.token
  end

end
