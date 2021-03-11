class Game
  attr_accessor :board, :player_1, :player_2
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

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    turn = @board.turn_count
    
    if turn % 2 == 0 
     current_token = "X"
    else
     current_token = "O"
    end
        
    if @player_1.token == current_token
      return @player_1
    else
      return @player_2
    end
  end
  
  def won?
   # Check if board is empty. Skip all if it is
   is_empty = @board.cells.all? do |cell|
    if cell == " "
        true
      else
        false
      end
    end 
    
    if is_empty == false 
      
      # Iterate through winning combos  
      WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
     
        if (@board.taken?(win_index_1 + 1) && @board.taken?(win_index_2 + 1) && @board.taken?(win_index_3 + 1))
         
          positions = [@board.cells[win_index_1], @board.cells[win_index_2], @board.cells[win_index_3]]
          
          all_x = positions.all? do |position|
            if position == "X"
              true
            else
              false
            end
          end 
          
          all_o = positions.all? do |position|
            if position == "O"
              true
            else
              false
            end
          end 
          
          # return winning combo if all the pieces match
          if all_x || all_o
            return win_combo
          end
        end
      end
      
      # If no winning combo, return false (for draw)
      is_draw = @board.cells.none? do |cell|
        if cell == " "
            true
          else
            false
          end
        end
        
      if is_draw
        return false
      end
    else
      return false
    end
  end
  
  def draw?
   is_full = @board.full?
   is_won = self.won?
   
   if is_full == true && is_won == false
     return true
   else
     return false
   end
  end
  
  def over?
   is_full = @board.full?
   is_won = self.won?
   is_draw = self.draw?
   
   if is_full || is_won || is_draw
     return true
   else
     return false
   end
  end
  
  def winner
   if (self.over? == false)
     return nil
   else
     win_combo = self.won?
     
     all_x = win_combo.all? do |cell|
          if @board.cells[cell] == "X"
            true
          else
            false
          end
      end 
      
      if all_x
        return "X"
      else
        return "O"
      end
   end
  end
  
  def turn
   self.current_player.move(@board)
  end
  
  def play
    until self.over?
      self.turn
      @board.display
    end
    
    if self.draw?
      puts "Cat's Game!"
    elsif self.won?
        puts "Congratulations #{winner}!"
    end
  end
end