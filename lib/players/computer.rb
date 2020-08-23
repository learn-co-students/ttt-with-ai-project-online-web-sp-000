require 'pry'

module Players
  class Computer < Player
    attr_accessor :cells
    attr_reader :board
    
def move(board)
  #center position
  # binding.pry
  if !board.taken?("5")
    "5"
  else
    computer_move(board)
  end
end

def computer_move(board)
  corner(board) || middle_corner(board)
end

def corner(board)
  if !board.taken?("1")
    "1"
  elsif !board.taken?("3")
    "3"
  elsif !board.taken?("7")
    "7"
  elsif !board.taken?("9")
    "9"
  end
end 
 

def middle_corner(board)
  if !board.taken?("2")
    "2"
  elsif 
    !board.taken?("4")
    "4"
  elsif 
    !board.taken?("6")
    "6"
  elsif 
    !board.taken?("8")
    "8"
  end
 end
    
    
 end
  
  
  
end