
class Board
  attr_accessor :cells, :player, :game

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    if @cells.any? {|index| index == nil || index == " "}
      return false
    else
      return true
    end
  end

  def turn_count
    counter = 0
      @cells.each {|space|
        if space == "X" || space == "O"
        counter += 1
        end}
      counter
  end

  def taken?(input)
    if position(input)== "X" || position(input)=="O"
  return true
else
  return false
end
  end

  def valid_move?(input)
    if (input.to_i-1).between?(0, 8) && !taken?(input)
    return true
  end
end

  def update(input, player)
    input = input.to_i-1
    @cells[input] = player.token
  end

end
