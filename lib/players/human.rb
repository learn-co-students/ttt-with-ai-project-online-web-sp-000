module Players
  class Human < Player
  
    def move(board)
      puts "Enter your move player #{token}. (1-9)"
      gets.strip
    end
  
  end
end