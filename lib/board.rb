require "pry"

class Board
  attr_accessor :cells

  def initialize(board = nil)
    @cells = cells || Array.new(9, " ")
  end

  def reset!
    @cells.clear
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
    input_to_position = user_input.to_i - 1
    @cells[input_to_position]
  end

  def full?
    @cells.all? do |i|
      i == "O" || i == "X"
    end
  end

  def turn_count
    @cells.select { |i| i == "X" || i == "O" }.count
  end

  def taken?(location)
    if @cells[location.to_i - 1] == " " || @cells[location.to_i - 1] == ""
      return false
    elsif @cells[location.to_i - 1] == "X" || @cells[location.to_i - 1] == "O"
      return true
    end
  end

  def valid_move?(location)
    if location.to_i.between?(1, 9) && !taken?(location) && location.to_i.is_a?(Integer)
      return true
    else
      return false
    end
  end

  def update(location, current_player)
    @cells[location.to_i - 1] = current_player.token
  end
end
