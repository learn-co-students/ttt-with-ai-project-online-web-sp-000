module Players
  class Human < Player
    
    def move(input)
      puts "where would you like to move? 1-9"
      gets.strip
    end
end
end