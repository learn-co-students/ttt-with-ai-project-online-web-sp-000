module Players
  class Human < Player
    
    def move(board)
      input = gets.strip
      board.update(input, self)
      input
    end
    
  end
end