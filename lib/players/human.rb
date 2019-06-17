module Players
  class Human < Player

    def move(board)
      puts "Please enter 1-9:"
      input = gets.strip
      if board.valid_move?(input)
        board.update(input, self)
        board.display
        input
      else
        self.move(board)
      end
    end

  end
end