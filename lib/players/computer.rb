module Players
  class Computer < Player 
    POSS_COMBOS = [
      [0,1],[1,2],[3,4],[4,5],
      [6,7],[7,8],[0,3],[3,6],
      [1,4],[4,7],[2,5],[5,8],
      [0,2],[3,5],[6,8],[0,6],
      [1,7],[2,8],[0,4],[0,8],
      [4,8],[2,4],[2,6],[4,6]
    ]
    COUNTERS = [
      3,0,5,3,
      8,6,6,0,
      7,1,8,2,
      1,4,5,3,
      4,5,8,4,
      0,6,4,2
    ]
    
    def move(board)
      sleep(1)
      
      # token is 'X'
      if self.token == 'X'
        
        poss_win = check_board('X', board)
        if poss_win
          return poss_win 
        end 
        
        poss_lose = check_board('O', board)
        if poss_lose  
          return poss_lose 
        end
      
      # token is 'O'
      else 
        
        poss_win = check_board('O', board)
        if poss_win
          return poss_win 
        end 
        
        poss_lose = check_board('X', board)
        if poss_lose  
          return poss_lose 
        end
      end
         
      # no impending wins
      if !board.position_taken?(4)
        return '5'
      else 
        poss = rand(0..8)
        while board.position_taken?(poss)
          poss = rand(0..8)
        end
        return (poss + 1).to_s
      end
    end
  
    def check_board(token, board)
      POSS_COMBOS.each_with_index do |combo, index|
        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == token
          if !board.position_taken?(COUNTERS[index])
            return (COUNTERS[index] + 1).to_s
          end
        end
      end
      return nil
    end
  end
end 
