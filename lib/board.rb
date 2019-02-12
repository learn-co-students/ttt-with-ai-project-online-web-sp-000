class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ",
              " ", " ", " ",
              " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    @cells = [" ", " ", " ",
              " ", " ", " ",
              " ", " ", " "]
  end

  def position(position)
    if position.class == String
      position = input_to_i(position)
    end
    @cells[position]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    @cells.count {|o| o == "X" || o == "O"}
  end

  def taken?(position)
    position(position) == "X" || position(position) == "O"
  end

  def valid_move?(position)
    position = input_to_i(position)
    position >= 0 && position <= 8 && !taken?(position)
  end

  def update(position, player)
    if valid_move?(position)
      @cells[input_to_i(position)] = player.token
    end
  end

  def input_to_i(input)
    input.to_i - 1
  end


end
