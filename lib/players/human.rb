module Players
  class Human < Player
    def move(board)
      puts "\nWhere would you like to move? (1-9)"
      gets.strip
      # board.display
    end
  end
end