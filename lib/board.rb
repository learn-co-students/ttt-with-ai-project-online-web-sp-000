class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(space, character)

   @cells[space] = character
  end

 def full?
   if @cells.include?(' ') || @cells.include?('')
    return false
   else
    return true
   end
 end

 def turn_count
  counter = 0
  @cells.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  counter
 end

 def taken?(integer)
  if @cells[integer.to_i] == "X" || @cells[integer.to_i] == "O"
   true
 else
   false
  end
 end

 def valid_move?(index)
  if (index < 0 || index > 8)
    false
  elsif position_taken?(index)
    false
  else
    true
  end
 end
end
