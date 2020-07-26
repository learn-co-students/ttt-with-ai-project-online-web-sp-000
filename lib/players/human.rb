module Players
  class Human < Player #Inherits all the functionality that we have in the Player module

    def move(board)
      puts "Please enter your selection."
      gets.strip
    end
  end

end
