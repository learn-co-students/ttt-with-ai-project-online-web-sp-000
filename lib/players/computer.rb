require 'pry'
module Players
  class Computer < Player
  
  def move(board)
    if board.valid_move?(5)
      input = "5"
    else
      i = 0
      corners = [1,3,7,9]
      while i < 4
        if board.valid_move?(corners[i])
          input = "#{corners[i]}"
        end
        i = i + 1
      end
      e = 0
      middle = [2,4,6,8]
      while e < 4
        if board.valid_move?(middle[e])
          input = "#{middle[e]}"
        end
        e = e + 1
      end
    end
    board.update(input, self)
    input
  end
  
  end
end