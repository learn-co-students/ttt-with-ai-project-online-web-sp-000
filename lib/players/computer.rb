module Players
  class Computer < Player
    # your code here
    
    def move(board)
      
      input = rand(1..10).to_s
      if (board.valid_move?(input))
        board.update(input,self)
      else
        move(board)
      end
      input
      
    end
    
  end
end