require 'pry'
class Board
  attr_accessor :cells
  user_input=" "
  token="X"
  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts"-----------"
    puts" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts"-----------"
    puts" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end
  
  def input_to_index(user_input)
    real_ui = user_input.to_i - 1
  end
  
  def move(ui, token)
    @cells[ui] = token
  end
  
  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

  def turn_count
    tc=0
    @cells.each { |x|
    if x!=" "
      tc=tc+1
    end
    }
    return tc
  end

  def full?
    @cells.all? { |space| space != " " }
  end

end