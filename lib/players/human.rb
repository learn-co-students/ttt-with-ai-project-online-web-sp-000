module Players
  class Human < Player #Player's methods are available to Human

    def move(board)
      puts "Please enter your choice:"
      choice = gets.strip
    end
  end
end
