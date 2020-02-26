require "pry"
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
    # @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
      puts (" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} ")
      puts ("-----------")
      puts (" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} ")
      puts ("-----------")
      puts (" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} ")
  end

  def position(num)
    index = num.strip.to_i
    if index.between?(1, 9)
      index-= 1
      @cells[index]
    end
  end

  def update(num, player)
    num = num.to_i-1
    @cells[num] = player.token
  end

  def full?
    !@cells.any? {|a| a == " "}
  end

  def taken?(num)
    position(num) != " "
  end

  def valid_move?(num)
    position(num) == " "
  end

  def turn_count
    @cells.count {|a| a != " "}
  end

end
