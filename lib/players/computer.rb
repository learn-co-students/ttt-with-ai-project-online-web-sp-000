module Players

class Computer < Player

  def move(board)
    @board = board

    if @board.turn_count <= 1
      move = "1"
    end


  end

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]


end
end
