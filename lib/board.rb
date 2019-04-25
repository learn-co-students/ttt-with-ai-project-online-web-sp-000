class Board
  attr_accessor :cells
   cells = []

  def reset!
    cells.clear
    cells.insert(0," ", " ", " ", " ", " ", " ", " ", " ", " ")
    cells
  end

  def initialize
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts '-----------'
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts '-----------'
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    user_input = user_input.to_i - 1
    cells[user_input]
  end

  def full?
    cells.all? { |token| token == 'X' || token == 'O' }
  end

  def turn_count
    cells.count { |token| token == 'X' || token == 'O' }
  end

  def taken?(user_input)
    position(user_input) == 'X' || position(user_input) == 'O'
  end

  def valid_move?(user_input)
    user_input = user_input.to_i
    user_input.between?(1, 9) && !taken?(user_input)
  end

  def update(user_input, player)
     user_input = user_input.to_i - 1
     cells[user_input] = player.token
  end

end
