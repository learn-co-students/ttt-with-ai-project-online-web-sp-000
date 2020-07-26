class Board
  attr_accessor :cells
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def display
    puts " "
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts '-----------'
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts '-----------'
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts " "
  end

  def input_to_index(input)
    index = input.to_i - 1 if input.is_a? String
  end
  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def update(input, player)
    index = input.to_i - 1
    @cells[index] = player.token
  end

  def full?
    @cells.all? { |token| token == 'X' || token == 'O' }
  end

  def turn_count
    @cells.count { |token| token == 'X' || token == 'O' }
  end

  def taken?(index)
    index = index.to_i - 1 if index.is_a? String
    @cells[index] == 'X' || @cells[index] == 'O'
  end

  def valid_move?(index)
    index = index.to_i - 1 if index.is_a? String
    index.between?(0, 8) && !taken?(index)
  end
end
