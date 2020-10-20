class Board

attr_accessor :cells

def initialize
  @cells = Array.new(9, " ")
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

def position(input)
  index = input.to_i - 1
  return @cells[index]
end

def full?
  @cells.none?{|i| i == " "}
end

def turn_count
  turn = 0
  @cells.each do |cells_move|
    if cells_move == "X" || cells_move == "O"
      turn +=1
    end
  end
  return turn
end

def taken?(input)
  index = input.to_i - 1
  if @cells[index] == "" || @cells[index] == " " || @cells[index] == nil
    false
  else
    true
  end
end

def valid_move?(input)
  if input.to_i.between?(1, 9) && !taken?(input)
    true
  else
    false
  end
end

def update(input, player)
  index = input.to_i - 1
  @cells[index] = player.token
end

end
