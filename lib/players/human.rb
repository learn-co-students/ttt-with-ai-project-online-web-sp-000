module Players
  class Human < Player
    def move(board)
      input = gets.chomp
      board.update(input, self)
      input
    end
  end
end
