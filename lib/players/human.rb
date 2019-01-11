module Players
  class Human < Player
    def move(board)
      puts "Please enter a number from 1-9"  #Is this only for Players::Computer?
      gets.strip
    end
  end
end
