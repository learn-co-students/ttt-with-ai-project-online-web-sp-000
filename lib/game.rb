class Game 
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end 
  
  WIN_COMBINATIONS = [
    [0,1,2], # top row 
    [3,4,5], # middle row 
    [6,7,8], # bottom row
    [0,3,6], # first column
    [1,4,7], # second column 
    [2,5,8], # third column 
    [0,4,8], # diagonal 1 
    [2,4,6] # diagonal 2 
    ]
    
  def current_player
    if @board.turn_count.even?
      player_1
    else 
      player_2
    end 
  end 
  
  def won? 
    WIN_COMBINATIONS.detect do |win|
      @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] == @board.cells[win[2]] && (@board.cells[win[0]] == "X" || @board.cells[win[0]] == "O")
    end 
  end 
  
  def draw? 
    @board.full? && !won?
  end 
  
  def over?
    won? || draw?
  end 
  
  def winner 
    if win_combo = won?
      @winner = @board.cells[win_combo[0]] 
    end 
  end 
  
  def turn 
    input = current_player.move(board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else 
      puts "Invalid move. Try again."
      turn 
    end 
  end
  
  def play 
    puts "Welcome to Tic Tac Toe!"
    @board.display
    counter = 0 
    until over? 
      turn 
      counter +=1 
    end 
    if won?
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end
  end 
end 