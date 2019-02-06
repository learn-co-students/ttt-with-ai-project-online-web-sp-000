class Board
  attr_accessor :cells

  def initialize
    reset!
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

  def position(input)
    input = input.to_i - 1
    @cells[input]
  end

  def full?
      !@cells.any? { |c| c == " " }
  end

  def turn_count
    move_counter = 0
    @cells.each do |space|
     if space == "X" || space == "O"
       move_counter += 1
     end
   end
     move_counter
  end

  def taken?(input)
    input = input.to_i - 1
    if (@cells[input] == " " || @cells[input] == "" || @cells[input] == nil)
      return false
    else
      return true
    end
  end

  def valid_move?(input)
    input_to_i = input.to_i - 1
    if !(taken?(input)) && input_to_i.between?(0, 8)
      true
    else
      false
    end
  end

end
