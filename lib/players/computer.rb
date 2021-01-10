module Players
  class Computer < Player
    
    def move(board)
      random_move = rand(1..9)
      
      if board.valid_move?(random_move)
        return random_move
      else
        move(board)
      end
    end
  end
end