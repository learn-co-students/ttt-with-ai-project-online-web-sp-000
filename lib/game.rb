class Game 
 
  attr_accessor :board, :player_1, :player_2   
  
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [0, 3, 6],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  [6, 7, 8],
  [1, 4, 7]
  
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1 
      @player_2 = player_2 
  end 
  
  def current_player 
     if board.turn_count.even? 
      return player_1
     else 
      return player_2
     end 
  end 
  
  def won?
    WIN_COMBINATIONS.select do |combo|
      if (board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]) && (board.cells[combo[0]] != " ")
          return combo
              end 
      end 
        false 
  end 
  
  def draw? 
    if board.full? && !won? 
      true 
    else 
      false 
    end 
  end 
  
  def over? 
    if draw? || won?
      true 
    else 
      false 
    end 
  end 
  
  def winner
    if won?
      combo = won?
      board.cells[combo[0]]
    else 
      return nil 
    end 
  end 
  
  def turn
    board.display 
    new_move = current_player.move(board) 
      if board.valid_move?(new_move) 
         board.update(new_move, current_player)
      else
         turn 
      end 
  end  
  
  def play 
    until over?
      turn 
    end 
    
    if won?
      board.display
      puts "Congratulations #{winner}!"
    end 
    
    if draw?
      puts "Cat's Game!"
    end 
  
  end 
  
 
end 