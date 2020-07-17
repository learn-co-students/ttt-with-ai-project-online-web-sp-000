module Players
  class Human < Player
    def move(game)
      puts "Please enter 1-9:"
      input = gets.strip
      return input
    end
  end
end
