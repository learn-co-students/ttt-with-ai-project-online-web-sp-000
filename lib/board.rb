class Board

    attr_accessor :board, :index, :value, :input, :cells
    
cells = []
    
def reset!
  self.cells = Array.new(9, " ")
end

def initialize
  reset!
end

def display
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end

def position(input)
  self.cells[input.to_i - 1]
end

def full?
  @cells.all? do |position|
  position == "X" || position == "O"
  end
end

def turn_count
  turn = 0
  @cells.each do |player|
    if player == "X" || player == "O"
      turn += 1
    end
    end
    turn
end
  
def taken?(index)
  index = index.to_i
  index -= 1
  if @cells[index] == "X" || @cells[index] == "O"
    true
  else
    false
  end
end
   
def valid_move?(input)
  input = input.to_i
  !taken?(input) && input.between?(1,9)
end

def update(index, player)
  index = index.to_i
  index -= 1
  @cells[index] = player.token
end
    
end