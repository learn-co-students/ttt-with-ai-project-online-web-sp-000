require 'pry'

module Players
  class Computer < Player
    
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    
    
    def move(board)
      
      # First 2 moves:
      
       if board.blank?
         "3"
        elsif board.cells[4] == " " 
         "5"
        
      # Evaluate player and opponent winning moves:
      elsif possible_winning_moves?(board)
        move = possible_winning_moves?(board).to_s.to_i + 1

      elsif offense_possible_winning_moves?(board)
        move = possible_winning_moves?(board).to_s.to_i + 1

      elsif winning_move?(board)
        move = winning_move?(board) + 1 
  

      elsif opponent_winning_move?(board)
        move = opponent_winning_move?(board) + 1 
  
        # Additional logic:
        
       else 
        rand(1..9)
       end
       
    end

    def possible_winning_moves?(board)
    
      if self.token == "X"
        token = "O"
      else 
        token = "X"
      end
      
      array_of_moves = map_moves(board, token)
      numbers = array_of_moves.flatten.reject{|letter| letter == "X" || letter == "O"}
      dup_value = numbers.detect {|a| numbers.count(a) > 1}
  
    end

    def offense_possible_winning_moves?(board)
    
      token = self.token
      
      array_of_moves = map_moves(board, token)
      numbers = array_of_moves.flatten.reject{|letter| letter == "X" || letter == "O"}
      dup_value = numbers.detect {|a| numbers.count(a) > 1}
  
    end

    def map_moves(board, token)
      winning_moves = []
      winning_moves = WIN_COMBINATIONS.map do |listArray|

        index_one = listArray[0]
        index_two = listArray[1]
        index_three = listArray[2]
        
        position_one = board.cells[index_one]
        position_two = board.cells[index_two]
        position_three = board.cells[index_three]
      
        if position_one == token && position_two == " " && position_three == " "
          new_array = [token, index_two, index_three]
        elsif position_one == " " && position_two == " " && position_three == token
          new_array = [index_one, index_two, token]
        elsif position_one == " " && position_two == token && position_three == " "
          new_array = [index_one, token, index_three]
        end
      
      end 
      winning_moves = winning_moves.compact
    
    end

    def winning_move?(board)
      
      token = self.token
      
      WIN_COMBINATIONS.each do |listArray|

        index_one = listArray[0]
        index_two = listArray[1]
        index_three = listArray[2]
        
        position_one = board.cells[index_one]
        position_two = board.cells[index_two]
        position_three = board.cells[index_three]
      
        if position_one == token && position_two == token && position_three == " "
            return index_three
        elsif position_one == token && position_two == " " && position_three == token
            return index_two
        elsif position_one == " " && position_two == token && position_three == token
            return index_one
        end
       
      end
      
      return false
        
    end
    
    
    
    def opponent_winning_move?(board)
      
      if self.token == "X"
        token = "O"
      else 
        token = "X"
      end
      
      WIN_COMBINATIONS.each do |listArray|

        index_one = listArray[0]
        index_two = listArray[1]
        index_three = listArray[2]
        
        position_one = board.cells[index_one]
        position_two = board.cells[index_two]
        position_three = board.cells[index_three]
      
        if position_one == token && position_two == token && position_three == " "
            return index_three
        elsif position_one == token && position_two == " " && position_three == token
            return index_two
        elsif position_one == " " && position_two == token && position_three == token
            return index_one
        end
       
      end
      
      return false
        
    end
    
    
    
    
  end
end