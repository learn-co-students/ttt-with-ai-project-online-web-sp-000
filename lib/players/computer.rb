module Players
  class Computer < Player
    def move(board)
      array_of_inputs = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      
      puts "Computer #{(board.turn_count % 2) + 1} is thinking...\n\n"
 #     sleep(3)
      
      #returns first random element that is valid move
      input = ""
      until board.valid_move?(input)
        input = array_of_inputs.sample(1)[0] #sample returns an array so you need [0] to grab element
      end
      input
    end
    

    

  end
  
end