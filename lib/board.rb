require 'pry'

class Board

  attr_accessor :cells, :token

  @cells = []

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
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
    @cells[input.to_i-1]
  end

  def full?
    @cells.all? {|y| y == "X" || y == "O"}
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1, 9)
  end

  def taken?(input)
    @cells[input.to_i-1] != " "
  end

  def turn_count
    @cells.count {|v| v != " "}
  end

  def update(input, token)
    @cells[input.to_i-1] = token.token
  end

end
