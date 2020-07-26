module Players
  class Human < Player 
    
    def move(board)
      board.display
      puts "Please enter 1-9:"
      input = gets.chomp
      puts "You chose #{input}"
      puts ''
      if board.valid_move?(input)
        board.update(input, self)
      else
        move(board)
      end
      input
    end
    
    def get_name
      get.chomp 
    end
    
  end
end

