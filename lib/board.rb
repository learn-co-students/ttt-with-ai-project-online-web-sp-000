require 'pry'

class Board

  WIN_COMBINATION = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    pos = @cells[input.to_i-1]
    pos
  end

  def winner
    WIN_COMBINATION.each do |win_combo|
      if win_combo[0] == "X" && win_combo[1] == "X" && win_combo[2] == "X"
        winner = "X"
      elsif
        win_combo[0] == "O" && win_combo[1] == "O" && win_combo[2] == "O"
        winner = "O"
      end
    end
    return winner
  end

  def full?
    if @cells.all? != " "
      true
    end
    binding.pry
  end

end
