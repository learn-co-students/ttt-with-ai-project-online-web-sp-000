module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6],
    ] 
    
    def opp_token
      if self.token == "X"
        return "O"
      else
        return "X"
      end
    end

    # return true if the cpu can win in this turn
    def win_1 (board)
      c_token = []
      
      # iterate each winning combo for any combo where the player wins the next turn
      WIN_COMBINATIONS.each do |win_combo|
        c_token.clear
        c_token << board.cells[win_combo[0]]
        c_token << board.cells[win_combo[1]]
        c_token << board.cells[win_combo[2]]
        
        # return hash of token count
        count = c_token.group_by { |v| v }.map { |k, v| [k, v.size] }.to_h
      
        if count[self.token] == 2 && count[" "] == 1
          return win_combo[c_token.index(" ")] + 1
        end
      end
      
      return false
    end
    
    # return true if cpu needs to block this spot in order to not lose
    def need_to_block (board)
      c_token = []
      
      # iterate each winning combo for any combo where the player wins the next turn
      WIN_COMBINATIONS.each do |win_combo|
        c_token.clear
        c_token << board.cells[win_combo[0]]
        c_token << board.cells[win_combo[1]]
        c_token << board.cells[win_combo[2]]
        
        # return hash of token count
        count = c_token.group_by { |v| v }.map { |k, v| [k, v.size] }.to_h
      
        if count[opp_token] == 2 && count[" "] == 1
          return win_combo[c_token.index(" ")] + 1
        end
      end
      return false
    end
    
    #return true if win combo contains a blank space and it's token
    def win_2 (board)
      c_token = []
      
      # iterate each winning combo for any combo where the player wins the next turn
      WIN_COMBINATIONS.each do |win_combo|
        c_token.clear
        c_token << board.cells[win_combo[0]]
        c_token << board.cells[win_combo[1]]
        c_token << board.cells[win_combo[2]]
        
        # return hash of token count
        count = c_token.group_by { |v| v }.map { |k, v| [k, v.size] }.to_h
      
        if count[self.token] == 1 && count[" "] == 2
          return win_combo[c_token.index(" ")] + 1
        end
      end
      return false
    end
    
    # determine 'best' possible move
    def determine_move(board)
      win_index = []
      corners = [0,2,6,8]
      non_corners = [1,3,5,7]
      priority = corners.shuffle[0];
      
      if board.turn_count == 0  # Self goes first 
        priority += 1 
        return priority.to_s
      elsif board.turn_count == 1  # Self goes 2nd
        if board.cells.index(opp_token) == 4
          priority += 1 
          return priority.to_s
        else 
          priority = 5 # stated for clarification
          return priority.to_s
        end
      else # Determine priority
      
        if win_1(board)
          return win_1(board).to_s
        elsif need_to_block(board)
          return need_to_block(board).to_s
        elsif win_2(board)
          return win_2(board).to_s
        end
        open_space = board.cells.index(" ") + 1
        return open_space.to_s
      end
    end
    
    def move(board)
      input = ""
      until board.valid_move?(input) do
        input = determine_move(board)
      end
      
      board.update(input, self)
      puts "\n"
      return input
    end
  end
end
