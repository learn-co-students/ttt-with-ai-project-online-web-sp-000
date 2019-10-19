module Players
  class Human < Player

    def move(token)
      puts "Please enter your move, 1-9:"
      input = gets.chomp
    end

  end
end
