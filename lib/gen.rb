module GenMethods

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  BOARDC = [0, 2, 6, 8]

  def won?

    WIN_COMBINATIONS.each do |f|
    index0 = f[0]
    index1 = f[1]
    index2 = f[2]


    position0 = @board.cells[index0]
    position1 = @board.cells[index1]
    position2 = @board.cells[index2]

    if position0 == "X"  && position1 == "X" && position2 == "X"  ||
       position0 == "O"  && position1 == "O" && position2 == "O"

     return f
    end
  end
     false
  end

end
