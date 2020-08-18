module Players
  class Human < Player
    def move(board)
      puts "Enter your move from 1-9!"
      input = gets.chomp
    end
  end
end