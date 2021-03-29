module Players
  class Human < Player
    
    def move(board)
      puts "Please enter a number 1-9:"
      input = gets.strip
      if board.valid_move?(input.to_i)
        board.update(input,self)
        input
      else
        move(board)
      end
    end
  end
end