module Players
  class Human < Player

    def move(board)
      puts "Please enter number 1-9."
      gets.chomp
    end
  end

end
