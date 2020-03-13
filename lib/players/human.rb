require "pry"

module Players
  class Human < Player
    def move(board)
    	puts "Where do you wanna go, Player #{self.token}?"
    	input = gets.strip
    end
  end
end