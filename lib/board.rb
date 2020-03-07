require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

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
    player_input = input.to_i - 1
    @cells[player_input]
  end

  def full?
    @cells.all?{|position| position != " "}
  end

  def turn_count
    @cells.count{|position| position != " "}
  end

  def taken?(input)
    @cells[input.to_i - 1] != " "
  end

  def valid_move?(input)
    valid = nil
    if (input.to_i - 1).between?(0,8) && taken?(input) == false
      valid = true
    else
      valid = false
    end
    valid
    #binding.pry
  end

  def update(input, player )
    @cells[input.to_i - 1] = player.token
  end

end
