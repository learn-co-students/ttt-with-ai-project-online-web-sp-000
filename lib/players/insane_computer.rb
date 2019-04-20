module Players
  class InsaneComputer < Player
    
    def move(board)
      #Should be unbeatable
      
      #computer logic steps
      #1 checks for win move (wins or blocks)
      #2 checks for setups (setups that will win in 2 moves, blocks or setup)
      #3 takes middle if not taken
      #4 takes corner if not taken
      #5 takes random
      
      positions = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      puts "Computer #{(board.turn_count % 2) + 1} is thinking...\n\n"
     # sleep(1)
      
      #****all board methods return index must add 1 to be 'input'
      if board.win_imminent? 
        almost = board.win_imminent?
        index_for_best_move = -1
        almost.each {|index| index_for_best_move = index if board.cells[index] == " "}
        index_for_best_move + 1 #you want to return the position of move not index!
      elsif board.setup?
        index_for_best_move = board.setup?
        index_for_best_move + 1
      elsif board.cells[4] == " " #check or take middle
        5
      elsif board.corner_move_available?
        index_for_best_move = board.corner_move_available?
        index_for_best_move + 1
      else 
        input = ""
        until board.valid_move?(input)
          input = positions.sample(1)[0] #sample returns an array so you need [0] to grab element
        end
        input
      end
    end
    
  end
end