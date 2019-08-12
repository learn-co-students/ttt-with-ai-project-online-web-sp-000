 module Players
  class Computer < Player
    
    attr_accessor :board, :current_player, :opponent
    
    VALID_MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
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
      move = strategy(board)
    end

    def strategy(board)
      if winning_decision(board) == current_player 
        attack_move(board)
      elsif winning_decision(board) == opponent_token
        block_move(board)  
      else 
        place_a_token(board)
      end
    end

  def opponent_token
      @opponent = @first_player == "X" ? "X" : "O"
    end

  def winning_decision(board)
    WIN_COMBINATIONS.each_with_index do |combo, index|
      
        a = []
        a << board.cells[combo[0]]
        a << board.cells[combo[1]]
        a << board.cells[combo[2]]
        
        if a.count(opponent_token) == 2
          opponent_token
        elsif a.count(current_player) == 2 
          current_player  
        end
    end    
  end 
  
  def place_a_token(board)
    placing_token = check_available_moves(board)
    placing_token.sample
  end

    def check_available_moves(board)
    
      available_moves = []
      board.cells.each_with_index do |cell,index|
        if cell == " "
        available_moves << index + 1
        end
      end
      available_moves
    end
    
    def attack_move(board) 
      WIN_COMBINATIONS.each_with_index do |combo, index|

        a << board.cells[combo[0]]
        a << board.cells[combo[1]]
        a << board.cells[combo[2]]
        
        if (a.count(current_player) == 2) && (combo[0] == " ")
          combo[0]
        elsif  (a.count(current_player) == 2) && (combo[1] == " ")
          combo[1]
        elsif (a.count(current_player) == 2) && (combo[2] == " ")
          combo[2]
        end
      end
    end 
    
    def block_move(board) 
      WIN_COMBINATIONS.each_with_index do |combo, index|

        a << board.cells[combo[0]]
        a << board.cells[combo[1]]
        a << board.cells[combo[2]]
        
        if (a.count(opponent_token) == 2) && (combo[0] == " ")
          combo[0]
        elsif  (a.count(opponent_token) == 2) && (combo[1] == " ")
          combo[1]
        elsif (a.count(opponent_token) == 2) && (combo[2] == " ")
          combo[2]
        end
      end
    end
  
  end
end