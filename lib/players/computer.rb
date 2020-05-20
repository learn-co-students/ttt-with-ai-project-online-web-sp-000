
module Players
  class Computer < Player
    
    attr_accessor :board
    
    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

    def move(board)
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      else
        any_open_space(board)
      end
    end
    
    def any_open_space(board)
      move = board.cells.index(" ") + 1
      move.to_s
    end

  end
end





    
    
    
    