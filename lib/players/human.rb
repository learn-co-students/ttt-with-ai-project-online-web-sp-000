module Players
  class Human < Player

    def move(input)
      puts "Please enter your move (1-9):"
      input = gets.chomp
      input
    end
  end

end
