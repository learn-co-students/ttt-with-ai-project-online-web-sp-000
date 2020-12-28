module Players
  class Human < Player
    # your code here
    
    def move(board)
      
      puts "Please enter your next move"
      input = gets.strip
      if (board.valid_move?(input))
        board.update(input,self)
      else
        puts "Invalid"
        move(board)
      end
      input
      
    end
    
  end
end