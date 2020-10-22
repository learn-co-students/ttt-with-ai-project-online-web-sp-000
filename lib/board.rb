class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def cells
    @cells
  end

  def reset!
    self.cells = (Array.new(9, " "))
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(pos)
    index = input_to_index(pos)
    cells[index]
  end

  def full?
    if cells.include? " " || nil
      return false
    else
      return true
    end
  end

  def turn_count
    count = 0
    cells.each do |pos|
      if (pos == "X")
        count += 1
      elsif (pos == "O")
        count += 1
      end
    end
    return count
  end

  def taken?(number) 
    number = number.to_i - 1 if number.class == String
    !(cells[number].nil? || cells[number] == " ")
  end

  def valid_move?(pos)
    new_pos = input_to_index(pos)
    new_pos.between?(0,8) && !taken?(new_pos)
  end

  def update(pos, player)
    index = input_to_index(pos)
    cells[index] = player.token
  end

  def input_to_index(input)
    input.to_i - 1
  end

end