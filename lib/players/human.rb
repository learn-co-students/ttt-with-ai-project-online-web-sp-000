module Players
  class Human < Player
    def move(board)
      puts "Where would you like to move?"
      answer = gets.strip
    end
  end
end