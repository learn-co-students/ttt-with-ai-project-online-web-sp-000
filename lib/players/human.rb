module Players
  class Human < Player

    def move(board)
      puts "Please enter your choice:"
      choice = gets.strip
      choice
    end
  end
end
