class Game 
  
  attr_accessor :board, :player_1, :player_2
 WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] 
  
  
  def initialize(player_1 = Player.new("X"), player_2 = Player.new("O"), board = [" "," "," "," "," "," "," "," "," "] )
    @board = board
    @player_2 = player_2
    @player_1 = player_1
  end
  
  def current_player
    
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
    
    win_index_1 = win_combination[0] 
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2] 
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
      else if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
      else
      false
      end
    end
    end
        false
    end
  
  def draw?
    if full? == true && won? == false
    return true 
    end
  end

  def over?
    if won? != false || draw? == true || full? == true
    true
    else
    false
    end
  end
  
  
end