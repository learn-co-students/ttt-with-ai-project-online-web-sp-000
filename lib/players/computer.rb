require_relative "../player.rb"

module Players
class Computer < Player
  
   def move(board)
    selection = 0
    spots = board.cells
   spots.each_with_index do |spot, index|
   if spot == " "
     selection = index + 1
  end
  end
  selection.to_s
  end
  
end
end