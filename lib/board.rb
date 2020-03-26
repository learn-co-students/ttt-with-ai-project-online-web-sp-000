class Board 

attr_accessor :cells

def initialize(cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
@cells = cells
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
  position = input.to_i - 1
  @cells[position]
end

def full?
    @cells.all? do |taken|
      taken == "X" || taken == "O"
 end
end    

def turn_count
  count = 0 
  @cells.each do |cell|
   if cell != " "  
    count += 1
  end
  end
  count
end

def taken?(index)
  if @cells[index.to_i - 1] == " " || @cells[index.to_i - 1] == "" || @cells[index.to_i - 1] == nil
    return false
  else 
    return true
  end
end

def valid_move?(index)
  new_index = index.to_i
  if new_index.between?(1,9) && !taken?(new_index)
    return true
  else
    false
  end
end

def update(index, player)
  new_index = index.to_i - 1
  @cells[new_index] = player.token
end
  
end
