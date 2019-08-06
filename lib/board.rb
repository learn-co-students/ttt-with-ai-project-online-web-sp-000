require 'pry'
class Board
  attr_accessor :board
  attr_reader :cells

  def initialize
    @board = board
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def cells=(cells)
    @cells = cells
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

  def position(user_input)
    position = user_input.to_i - 1
    @cells[position]
  end

  def full?
    @cells.none? {|p| p == " "}
  end

  def turn_count
    @cells.count - @cells.count(" ")
  end

  def taken?(user_input)
    self.position(user_input) != " "
  end

  def valid_move?(user_input)
    if user_input.to_i > 0
      self.position(user_input) == " "
    end
  end

  def update(user_input, player)
    if self.valid_move?(user_input)
      @cells[user_input.to_i - 1] = player.token
    end
  end
end
