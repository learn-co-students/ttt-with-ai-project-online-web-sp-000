class Board 

attr_accessor :cells, :current_token 

def initialize

@cells = [" "," "," "," "," "," "," "," "," "]
@current_token = "X"
end


def reset! 
  @cells = [" "," "," "," "," "," "," "," "," "]
end 


def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  
end

def position(index)
  @cells[index.to_i - 1]
end

def update(move, token)
  @cells[move.to_i - 1] = @current_token
  if @current_token == "X"
    @current_token = "O"
  else 
    @current_token = "X"
  end
end

def turn_count
  counter = 0 
  @cells.each do |spot|
    if spot != " "
      counter += 1
    end
  end
    return counter
  end
  
def taken?(spot)
  if @cells[spot.to_i - 1] != " "
    true 
  else
    false
  end
end
  
def full?
  @cells.all?{|token| token == "X" || token == "O"}
end 

def valid_move?(move)
  if taken?(move) == false
    int_adjusted = move.to_i - 1 
  if int_adjusted >= 0 && int_adjusted <= 8
    return true
  else false
end
  else false
end
    
end
end