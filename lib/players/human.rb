class Players
  class Human < Player
    def move (input)
      puts "What position would you like to take?"
      input = gets.chomp
      input
    end
  end
end
