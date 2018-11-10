module Players
  class Human < Player
    def move(board = nil)
      puts "Please choose a number 1-9"
      input = gets.strip
    end
  end
end
