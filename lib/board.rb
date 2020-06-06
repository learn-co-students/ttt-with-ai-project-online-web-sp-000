class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
     user_input = input.to_i - 1
     @cells[user_input]
  end

  def full?                   #do any of these values hold an "X" or an "O"?
    @cells.all? do |cell|
      cell == "X" || cell == "O"
    end
  end

  def turn_count
    @cells.count do |cell|
      cell == "X" || cell == "O"
    end
  end

#   def taken?(input)
#     user_input = input.to_i - 1
#     return true if @cells[user_input] == "X" || @cells[user_input] == "O"
#     false
#   end
# end

  def taken?(input)
    user_input = input.to_i - 1
    if @cells[user_input] == "X" || @cells[user_input] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    user_input = input.to_i - 1
    if @cells[user_input].between?(0, 9) || @cells[user_input] != taken?
      true
    else
      false
    end


  end





end
