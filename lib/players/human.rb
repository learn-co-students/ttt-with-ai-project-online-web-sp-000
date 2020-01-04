module Players
  class Human < Player
    # your code here
    def move(board)
    	puts "Waiting for Player '#{self.token}' move: ..."
    	gets.strip
    end
  end
end