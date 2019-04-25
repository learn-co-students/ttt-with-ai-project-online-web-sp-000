module Players
  class Human < Player
    def move(board)
      puts "Where would you like to move?"
      board.display
      input = gets.chomp
    end
  end
end