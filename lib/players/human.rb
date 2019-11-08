module Players
  class Human < Player
    
    def move(board)
      puts "What is your move?"
      input = gets.strip
    end
    
  end
end
