module Players
  class Human < Player
    
    def move(input)
      puts "Type where you would like to go!"
      gets.strip
    end
end
end