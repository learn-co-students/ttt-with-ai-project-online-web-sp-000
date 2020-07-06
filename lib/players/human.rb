module Players
  class Human < Player

    def move(input)
      puts "Please enter your selection."
      gets.strip
    end

  end
end
