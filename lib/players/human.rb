module Players
  class Human < Player
    
    def move(board)
      puts "Please enter 1-9:"
      input = ""
      
      until board.valid_move?(input) do
        input = gets.strip
      end
      
      board.update(input, self)
      return input
      
    end
  end
end