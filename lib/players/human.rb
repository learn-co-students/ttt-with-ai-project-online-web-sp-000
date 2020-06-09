module Players
  class Human < Player
    def move(board)
      puts "Please input number 1-9"
      gets.strip
    end
  end
end
