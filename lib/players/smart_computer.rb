module Players
  class SmartComputer < Player
    def move(board)
      
      #SmartComputer is able to see if win is imminent and block or make winning move.
      #Otherwise makes random valid move.
      
      puts "Computer #{(board.turn_count % 2) + 1} is thinking...\n\n"
    #  sleep(3)
      
      positions = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      almost = board.win_imminent?
      
      #if win is not imminent play random valid move.
      if board.win_imminent? == false
        input = ""
        until board.valid_move?(input)
          input = positions.sample(1)[0] #sample returns an array so you need [0] to grab element
        end
        input
      else
        index_for_smart_move = -1
        almost.each {|index| index_for_smart_move = index if board.cells[index] == " "}
        index_for_smart_move + 1 #you want to return the position of move not index!
      end
      
      
    end
    
  end
  
end