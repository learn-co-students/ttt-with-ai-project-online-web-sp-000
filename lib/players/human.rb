module Players 
  class Human < Player 
    def move(board)
      puts "Please select your position on the board"
      gets.strip 
    end 
  end 
end 