module Players
  class Human < Player
    def move(board)
      puts "Please select a square 1-9."
      gets.strip
    end
  end
end
