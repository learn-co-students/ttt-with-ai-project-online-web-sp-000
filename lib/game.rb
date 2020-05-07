require 'pry'
class Game 
  
  attr_accessor :player_1, :player_2, :board
  

  WIN_COMBINATIONS = 
  [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [2,5,8],
  [1,4,7]
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if turn_count % 2 == 0 
      return @player_1
    else turn_count % 2 == 1 
      return @player_2
    end
  end
  
  def turn_count
    counter = 0
    @board.cells.each do |value|
      if value == "X" || value == "O"
        counter += 1
      end
    end
    counter
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && 
      @board.cells[combo[1]] == @board.cells[combo[2]] && 
      @board.taken?(combo[0]+1)
    end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      combination = won?
      @board.cells[combination[0]] # X or O
    end
  end
 

  def turn
    @user_input = current_player.move(@board)
    if !@board.valid_move?(@user_input)
      turn
    else 
      # binding.pry
      @board.display
      @board.update(@user_input, current_player)
      @board.display
    end
  end
  
  def play
    while !over? 
      turn
    end 
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end