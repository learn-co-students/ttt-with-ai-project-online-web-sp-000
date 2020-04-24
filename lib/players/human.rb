module Players

  class Human < Player

    def move(board)
      puts "What move would you like to make? (input 1-9)"
      input = gets.strip
      if board.update(input, self) == nil
        puts "invalid"
        self.move(board)
      else
        board.update(input, self)
        input
      end
    end
  end

end
