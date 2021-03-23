class Game
  attr_accessor :board, :player_1, :player_2, :user_input
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end 
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
    
  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && 
      board.cells[combo[1]] == board.cells[combo[2]] && 
      board.taken?(combo[0]+ 1)
    end
  end 
  
  def draw?
    !won? && board.full?
  end 
   
  def over?
   won? || draw? 
  end 
   
  def winner
   if won? 
     board.cells[won?.first]
    end 
  end 
   
  def turn
   puts "Please pick a number between 1-9"
    @user_input = current_player.move(@board)
      if board.valid_move?(@user_input)
        board.update(@user_input, current_player)
      else 
       puts "invalid"
        board.display
        turn 
    end 
    board.display
  end 

  def play 
    while !over? && !draw?
    turn 
    end 
     if over? && won?
       puts "Congratulations #{winner}!"
     else draw?
      puts "Cat's Game!"
    end
  end 
end 