module Players
  class Human < Player
    def move(board)
      puts "Choose a space."
      gets.strip
    end
  end
end