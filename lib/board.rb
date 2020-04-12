
# class Board
#   attr_accessor :cells
#
#   def initialize
#     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#   end
#
#   def reset!
#     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#   end
#
#   def display
#     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
#     puts "-----------"
#     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
#     puts "-----------"
#     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
#   end
#
#   def position(input)
#     index = input.to_i
#     index-= 1
#     @cells[index]
#   end
#
#   def full?
#     @cells.all? {|a| a == "X" || a == "O"}
#   end
#
#   def turn_count
#     @cells.count{|turn| turn == "X" || turn == "O"}
#   end
#
#   def taken?(input)
#     !(position(input).nil? || position(input) == " ")
#   end
#
#   def valid_move?(input)
#     if taken?(input) == true
#       false
#     elsif taken?(input) == false && input.to_i == 1..9
#       true
#     end
#   end
#
#   def update(input, player)
#     @cells[input.to_i - 1] = player.token
#   end
#
# end
class Board
  attr_accessor :cells

  def initialize
    reset!
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
    cells[input.to_i-1]
  end

  def full?
    cells.all? { |cell| cell == "X" || cell == "O" }
  end

  def turn_count
    cells.count { |cell| cell == "X" || cell == "O" }
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end
end
