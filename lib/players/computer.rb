module Players

class Computer < Player

  def move(board)

  i=["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
  if board.cells[i.to_i]=" "
    i
  end
  end

end
end
