#define Human class that inherits from Player
#human player must implement #move method (that takes in board argument) which allows human player to enter a move in cli

module Players
  class Human < Player
    
    def move(board)
      puts "What is your move?"
      input = gets.strip
    end
    
  end
end
# Now when you call your Human class, you'll have to call it inside its name space with Players::Human.