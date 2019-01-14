module Players
  class Human < Player

    def move(board)
      puts "#{self.token}'s turn. Which position do you want to place your token?> "
      position = gets
      if !board.valid_move?(position)
        self.move(board)
      end
      board.update(position, self)
      position
    end

  end
end
