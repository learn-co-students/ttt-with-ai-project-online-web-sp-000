class Game
  attr_accessor :board, :player_1, :player_2 
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
     @player_1 = player_1
     @player_2 = player_2
     @board = board
     # @board.display
  end 
  
  def current_player
    # board.turn_count.even? ? player_1 : player_2
    board.turn_count % 2 == 0 ? player_1 : player_2
  end 
  
  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end 
  end 
  
  def over?
    won? || draw?  
    # if either the won? or the draw? methods return true, the over? method returns true
  end 
  
  def won?
    # need to iterated through each combo and see whether or not in each of those cells is the same character
    WIN_COMBINATIONS.detect do |winner|
      @board.cells[winner[0]] == @board.cells[winner[1]] &&
      @board.cells[winner[1]] == @board.cells[winner[2]] &&
      @board.taken?(winner[0]+1)
       #Need to +1, because #taken? rspec test is working off user_input range (1-9)
    end
  end 
  
  def draw?
    @board.full? && !won? 
  end 
  
  def turn 
    puts "Please enter a number 1-9:"
    @user_input = current_player.move(@board)   #uses move method from the human class inheriting from the player class 
    if @board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
      # if the user_input is valid then it updates the board with the current_player
    else puts "Please enter a number 1-9:"
      @board.display
      turn
      # if user_input is invalid then it asks for input again, displays the board, and starts the turn method over
    end 
    @board.display
  end 
  
  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end 
  
  
  
end 

