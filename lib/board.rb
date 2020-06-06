require 'pry'
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} \n-----------\n #{cells[3]} | #{cells[4]} | #{cells[5]} \n-----------\n #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    num = user_input.to_i
    cells[num - 1]
  end

  def full?
    if cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    cells.count {|x| x != " "}
  end

  def taken?(input)
    if self.position(input) != " "
      true
    else
      false
    end
  end

  def valid_move?(input)
     input = input.to_i
     !(taken?(input)) && input.between?(1, 9)
  end

  def update(input, player)
    input = input.to_i
    cells[input - 1] = player.token
  end

end
