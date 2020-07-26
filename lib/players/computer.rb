module Players
  class Computer < Player
    attr_accessor :board
    
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]
  
    def move(board)
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[7] == " "
        "8"
      end

    end

  
  
  
    def winchecker
  
      grid = []   ##to collect the current state of win combinations
      holder = [] ## temporary holder for gathering current state of win combinations
      
      WIN_COMBINATIONS.each do |x|
      
      win_index_1 = x[0]
      win_index_2 = x[1]
      win_index_3 = x[2]
      
      holder << @board.cells[win_index_1]
      holder << @board.cells[win_index_2]
      holder << @board.cells[win_index_3]
      
      
        grid << holder ##collect all win combinations and the board's current state
        holder = [] ##refresh holder for then next iteration of win combinations
      end
      
      counter = 0  ##to identify how many iterations in the win combinations needed to find a win combo
      combo = [] ## placeholder for winning combo
      grid.each do |xxx|
        y = xxx.detect{ |e| xxx.count(e) > 1 }  ##iterating looking for possible attack/defend scenarios
        if y == "X" && xxx.count(" ") == 1
          combo = xxx
          break  ##once found, get out of the loop
        elsif y == "O" && xxx.count(" ") == 1
          combo = xxx
          break ##once found, get out of the loop
        else
          counter+=1 ##if no scenario is found, continue to iterate the winning combinations constant
        end
      end
      
      if counter > 7 ##engange if no winning combination is found/ no need to attack or defend
        target_index = @board.cells.rindex(" ") ##defaults to last space where available
        else
        blank_index = combo.index(" ") ##if break engages above, save the index of the blank space where AI needs to attack/defend
        target_index = WIN_COMBINATIONS[counter][blank_index] ##iterate again with the WIN COMBINATIONS using the counter to find the index for the " "
      end
  
      target_index+=1 ##return index plus 1 for positioning
      
      end
    end
end

