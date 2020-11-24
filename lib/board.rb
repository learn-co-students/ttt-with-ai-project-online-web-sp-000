class Board
  attr_accessor :cells
  def reset!
    @cells = Array.new(9, " ")
  end
  def initialize
    @cells = Array.new(9, " ")
  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def position(user_input)
    index = input_to_index(user_input)
    @cells[index]
  end
  def full?
    @cells.all? {|index| index == "X" || index == "O"}
  end
  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end
  def taken?(user_input)
    index = input_to_index(user_input)
    !(@cells[index].nil? || @cells[index] == " ")
  end
  def valid_move?(user_input)
    index = input_to_index(user_input)
    index.between?(0,8) && !taken?(user_input)
  end
  def update(user_input, player)
    index = input_to_index(user_input)
    @cells[index] = player.token
  end
end
