module Players
  class Human < Player
    #is the user input request for this instance of human player
    def move(board)
      puts "Player #{(board.turn_count % 2) + 1}'s turn!"
      puts "Please enter position(1-9):"
      gets.chomp
    end
    
  end
end