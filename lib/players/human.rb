module Players
  class Human < Player
    def move (board)
      puts "Where would you like to make a move? (Pick a number between 1-9)"
      gets.strip
    end
  end
end
