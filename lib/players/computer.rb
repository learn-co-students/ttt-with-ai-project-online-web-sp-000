module Players
  class Computer < Player 
  
    def move(board)
      win_index = check_for_winning_index(board)
      win_prevention_index = check_for_win_prevention_index(board)
      middle_index = 4
      corner_indices = [0,2,6,8]
      if win_index
        (win_index + 1).to_s
      elsif win_prevention_index
        (win_prevention_index + 1).to_s
      elsif board.cells[middle_index] == " "
        (middle_index + 1).to_s 
      elsif corner_indices.any? {|index| board.cells[index] == " "}
        (corner_indices.detect {|index| board.cells[index] == " "} + 1).to_s
      else
        (board.cells.each_index.detect {|index| board.cells[index] == " "} + 1).to_s
      end
    end
    
    def check_for_winning_index(board)
      board.cells.each_index.select do |index| 
          Game::WIN_COMBINATIONS.detect {|combination| combination.all? {|win_index| board.cells[win_index] == self.token || win_index == index && board.cells[win_index] == " "}}
      end[0]
    end
    
    def check_for_win_prevention_index(board)
      board.cells.each_index.select do |index| 
          Game::WIN_COMBINATIONS.detect {|combination| combination.all? {|win_index| board.cells[win_index] == self.opponent_token || win_index == index && board.cells[win_index] == " "}}
      end[0]
    end
    
    def opponent_token
      self.token == "X" ? "O" : "X"
    end
    
  end
end