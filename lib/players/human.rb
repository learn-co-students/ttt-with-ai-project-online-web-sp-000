module Players
  class Human < Player
    def move(board)
      puts "Please enter the position you'd like to move to"
      input = gets.chomp
    end
  end
end
