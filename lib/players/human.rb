module Players
  
  class Human < Player
    
    def move(board)
      puts "please enter from 1-9"
      input = gets.strip
      return input
    end
  end
end