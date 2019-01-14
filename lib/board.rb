class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def position(position)
    @cells[position.to_i - 1]
  end

  def full?
    @cells.all? {|token| token == "X" || token == "O"}
  end

  def turn_count
    count = 0
    @cells.each do |token|
      count += 1 if token == "X" || token == "O"
    end
    count
  end

  def taken?(position)
    @cells[position_to_index(position)] != " "
  end

  def valid_move?(position)
    index = position_to_index(position)
    valid_index_range?(index) && !taken?(position)
  end

  def update(position, player)
    index = position_to_index(position)
    @cells[index] = player.token
  end

  #private methods
  private

  def position_to_index(position)
      position.to_i - 1
  end

  def valid_index_range?(index)
    index >= 0 && index <= 8
  end

end
