module Players
  class Human < Player
    def move(board)
       puts "Please enter where you want to move?"
      input = gets.strip
      return input
    end
  end
end
