module Players
class Computer < Player

  def move(board)
    if board.position("5") == " " then "5"
    else board.cells.each_with_index do |cell, index|
      if cell == " " then index+1
      end
    end
   end
  end


end
end
