module Players
  class Human < Player
    
    def move(board)
      input = gets.strip
      if board.valid_move?(input)
        board.update(input, self)
        input
     else
        false
      end
    end
    
  end
end