

 Players
  class Computer < Player
    
    attr_accessor :board, :current_player, :oponent
    
    @@valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
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
      move = winning_moves(board)
      move.to_i + 1
    end
   
    def opponent_token
      @opponent = @first_player == "X" ? "X" : "O"
    end
    
    def winning_moves(board)
      a = Hash.new
        WIN_COMBINATIONS.each_with_index do |combo, index|
        
        a[combo[0]] = board.cells[combo[0]]
        a[combo[1]] = board.cells[combo[1]]
        a[combo[2]] = board.cells[combo[2]]

          if a.has_value?(opponent_token)
            a.delete_if { |key, value| value == opponent_token }
            return a.keys.sample
          else 
            return a.clear
          end
        end
    end
    
  end
end