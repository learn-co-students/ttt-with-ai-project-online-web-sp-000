require 'pry'

module Players
  class Human < Player
    def move(board)
      puts("Enter input.")
      input = gets.strip
    end
  end
end
