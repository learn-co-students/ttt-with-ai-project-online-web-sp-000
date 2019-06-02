
class Board
  attr_accessor :cells

  def initialize
    @cells = set_default_cells
  end

  def display
    lines = "-----------".colorize(:light_blue)
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts lines
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts lines
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "************".colorize(:yellow)
  end

  def reset!
    @cells = set_default_cells
  end

  def position(input)
    return cells[input.to_i - 1]
  end

  def full?
   cells.all?{|element| element != " " && element != "" && element != nil }
  end

  def turn_count
    cells.count { |letter| letter == "X" || letter == "O" }
  end

  def taken?(index)
    if cells[input_to_index(index)] == "X" || cells[input_to_index(index)] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && (0..8).cover?(input_to_index(index))
      return true
    else
      return false
    end
  end

  def update(index, player)
    cells[input_to_index(index)] = player.token.to_s
  end

  private

  def set_default_cells
    Array.new(9, " ")
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def position_taken?(index)
    if cells[input_to_index(index)] == " "
      return false
    else
      return true
    end
  end

end