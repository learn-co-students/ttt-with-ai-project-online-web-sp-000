class Board
  attr_accessor :cells

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

  def position(num)
    num = input_to_index(num)
    @cells[num]
  end

  def turn_count
    @cells.count { |x| x != " " }
  end

  def full?
    @cells.include?(" ") == false
  end

  def reset!
    self.cells = [" "]*9
  end

  def taken?(position)
    @cells[input_to_index(position)] != " "
  end

  def valid_move?(position)
    !taken?(position) && position.to_i.between?(1,9)
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def update(position, player)
    @cells[input_to_index(position)] = player.token
  end
end
