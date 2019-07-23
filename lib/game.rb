class Game 
  
  require "pry"
  attr_accessor :board, :player_1, :player_2, :token
 WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] 
  
   
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_2 = player_2
    @player_1 = player_1
  end
  
  
  def current_player
    if @board.turn_count.even?
    @player_1
    else
    @player_2
    end 
  end


  def won?
    WIN_COMBINATIONS.each do |win_combination|
    
    win_index_1 = win_combination[0] 
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2] 
    position_1 = @board.cells[win_index_1]
    position_2 = @board.cells[win_index_2]
    position_3 = @board.cells[win_index_3]
    
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
  
  def full?
      @board.cells.all? do |value|
      value == "X" || value == "O"
      end
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
  
  def winner
      if won?
       won?.all? do |value|
        if @board.cells[value] == "X"
        return "X"
        else if @board.cells[value] == "O"
        return "O"
        end
       end
      end
      end 
    return nil
    end  
    
  def turn
   player = current_player
   current_move = player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, player)
      @board.display 
    else
    turn 
    end
  end
  
    def play
      until over?
      turn
      end
      if won?
      puts "Congratulations #{winner}!"
    
      else if draw?
      puts "Cat's Game!"
      end
      end
  end 
  
  
  
end